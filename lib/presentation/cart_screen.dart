import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../shared/constants/spaces.dart';

class CartScreen extends StatefulWidget {

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1C161E),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h),
              child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children:[
                    Center(
                      child: Text(
                        'Cart',
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: 15.w,
                      ),
                      child: InkWell(
                        onTap: cartItems.length !=0? () {
                          showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  backgroundColor: Color(0xffEFE3C8),
                                  content: Text(
                                    'Clear Cart?',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          onPressed:() {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed:() {
                                            setState(() {
                                              cartItems.clear();
                                              for(int i=0; i<ProductModel().myProduct.length; i++)
                                              {
                                                ProductModel().myProduct[i].quantity=1;
                                              }
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                          );
                        }: null,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(color: cartItems.length !=0? Color(0xffEFE3C8): Colors.grey)
                          ),
                          width: 73.w,
                          height: 27.h,
                          child: Center(
                            child: Text(
                              'Clear',
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: cartItems.length !=0? Color(0xffEFE3C8): Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            SizedBox(
              height: 345.h,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        cartItems.removeAt(index);
                        ProductModel().myProduct[index].quantity=1;
                      });
                    },
                    key: ValueKey<Product>(cartItems[index]),
                    child: CartItem(cartItems[index]),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemCount: cartItems.length,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            DottedLine(
                dashColor: Colors.brown,
                dashLength: 15,
                lineLength: MediaQuery.of(context).size.width - 30,
                lineThickness: 4
            ),
            Spaces.vSpacingS,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              child: Row(
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    calculateTotal().toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spaces.vSpacingS,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              child: Row(
                children: [
                  Text(
                    'TAX  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '(12%)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    calculateTax(calculateTotal()).toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spaces.vSpacingM,
            DottedLine(
                dashColor: Colors.grey.withOpacity(0.4),
                dashLength: 15,
                lineLength: MediaQuery.of(context).size.width - 30,
                lineThickness: 4
            ),
            Spaces.vSpacingS,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              child: Row(
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    calculateSubtotal(calculateTotal(), calculateTax(calculateTotal())).toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xffEFE3C8),
              ),
              width: 210.w,
              height: 35.h,
              child: Center(
                child: Text(
                  'ORDER NOW',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget CartItem(Product cartItem) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      color: Color(0xff362C36),
    ),
    height: 90.h,
    child: Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: AssetImage(
                      cartItem.image
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 80.h,
              width: 80.w,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 7.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    cartItem.name.replaceAll('\n', ' '),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        cartItem.price,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey[700],
              ),
              width: 100.w,
              height: 35.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if(cartItem.quantity>1){
                          cartItem.quantity--;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xffEFE3C8)
                      ),
                      width: 35.w,
                      height: 35.h,
                      child: Center(
                        child: Icon(
                          Icons.remove,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${cartItem.quantity}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if(cartItem.quantity<9)
                        {
                          cartItem.quantity++;
                        }
                        else
                        {
                          Fluttertoast.showToast(
                            msg: 'Max Amount',
                          );
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xffEFE3C8)
                      ),
                      width: 35.w,
                      height: 35.h,
                      child: Center(
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
    ),
  );

}
