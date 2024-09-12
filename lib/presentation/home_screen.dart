import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/constants/spaces.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

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
                        child: Container(),
                      ),
                      Spacer(),
                      SizedBox(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width*0.8,
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 7.w,
                            mainAxisExtent: 210.h,
                          ),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                          ),
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
}
