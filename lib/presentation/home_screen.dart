import 'package:coffee_app/models/side_menu_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/products_model.dart';
import '../shared/constants/spaces.dart';
import 'item_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? SelectedType = MySideMenu.sideMenuList[0].name;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1C161E),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffEFE3C8),
                  ),
                ),
              ),
              Spaces.vSpacingS,
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xff362C36),
                  ),
                  width: 330.w,
                  height: 35.h,
                  child: Row(
                    children: [
                      Spaces.hSpacingM,
                      Icon(
                        Icons.search,
                        size: 25.sp,
                        color: Color(0xffEFE3C8),
                      ),
                      Spaces.hSpacingM,
                      Text(
                        'Browse your favourite coffee',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Color(0xffEFE3C8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spaces.vSpacingM,
              Expanded(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.r),
                          ),
                          color: Color(0xff3f2827),
                        ),
                        width: 40.w,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 28.h,
                            left: 8.w,
                          ),
                          child: ListView.separated(
                            itemBuilder: (context, index) => SideMenu(MySideMenu.sideMenuList[index]),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 22.h,
                            ),
                            itemCount: MySideMenu.sideMenuList.length,
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width*0.8,
                        child: GridView.builder(
                          itemCount: ProductModel().myProduct.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 7.w,
                            mainAxisExtent: 210.h,
                          ),
                          itemBuilder: (context, index) => CoffeeItem(ProductModel().myProduct[index]),
                        ),
                      ),
                      Spacer(),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget SideMenu(MySideMenu menuSideList) => RotatedBox(
    quarterTurns: 3,
    child: InkWell(
      onTap: () {
        setState(() {
          SelectedType = menuSideList.name;
        });
      },
      child: Text(
        '${menuSideList.name}',
        style: TextStyle(
          fontSize: 15.sp,
          fontStyle: FontStyle.italic,
          color:
          SelectedType == menuSideList.name ? Color(0xffEFE3C8) : Color(0xff857554),
        ),
      ),
    ),
  );

  Widget CoffeeItem(Product coffeeProduct) => InkWell(
    onTap: () {
      coffeeProduct.type = SelectedType!;
      Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => ItemScreen(coffeeProduct),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xff362C36),
      ),
      child: Padding(
        padding: EdgeInsets.all(13.r),
        child: Column(
          children: [
            Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.r),
                      image: DecorationImage(
                        image: AssetImage(
                          coffeeProduct.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 100.h,
                    width: 120.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        bottomRight: Radius.circular(13.r),
                      ),
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    width: 45.w,
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 17.sp,
                        ),
                        Text(
                          coffeeProduct.rate,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
            Spacer(),
            Text(
              coffeeProduct.name,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xff463D46),
                  ),
                  width: 115.w,
                  height: 30.h,
                  child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '\$',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          coffeeProduct.price,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffEFE3C8),
                    ),
                    width: 37.w,
                    height: 33.h,
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

}
