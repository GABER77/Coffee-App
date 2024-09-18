import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../presentation/cart_screen.dart';
import '../../presentation/home_screen.dart';

class NavBar extends StatefulWidget {

  int currentNavBarIndex;
  NavBar(this.currentNavBarIndex);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[widget.currentNavBarIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
        currentIndex: widget.currentNavBarIndex,
        onTap: (int newIndex){
          setState(() {
            widget.currentNavBarIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff22151F),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xffEFE3C8),
        unselectedItemColor: Color(0xff69614e),
        iconSize: 30.sp,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
      ),
      ),
    );
  }
}
