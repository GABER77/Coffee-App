import 'package:coffee_app/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/constants/spaces.dart';

class ItemScreen extends StatefulWidget {

  Product myProduct;
  ItemScreen(this.myProduct);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  List<String> milkType = ["Oat Milk", "Soy Milk", "Almond Milk"];
  int? selectedMilk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C161E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 10.h,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            image: DecorationImage(
                              image: AssetImage(
                                  '${widget.myProduct.image}'
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width:330.w,
                          height: 280.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.r),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: Color(0xFF1C161E)
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 25.sp,
                                color: Colors.white,
                              ),
                              width: 40.w,
                              height: 40.h,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '${widget.myProduct.type}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                    children: [
                      Text(
                        '${widget.myProduct.name.replaceAll('\n', ' ')}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        size: 20.sp,
                        color: Colors.amber,
                      ),
                      Spaces.hSpacingS,
                      Text(
                        '${widget.myProduct.rate}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${widget.myProduct.description}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Choice of Milk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedMilk = index;
                          });
                        },
                        child: Container(
                          width: 104.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: selectedMilk == index? Color(0xffEFE3C8) : Colors.transparent,
                            border: Border.all(color: Color(0xffEFE3C8)),
                          ),
                          child: Center(
                            child: Text(
                              milkType[index],
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: selectedMilk == index? Colors.black : Color(0xffEFE3C8),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 9.w),
                    itemCount: milkType.length,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 17.w,
                    ),
                    Text(
                      '\$',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.sp,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "${widget.myProduct.price}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 210.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color(0xffEFE3C8),
                        ),
                        child: Center(
                          child: Text(
                            'BUY NOW',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}
