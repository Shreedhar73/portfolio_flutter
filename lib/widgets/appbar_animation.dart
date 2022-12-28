// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/controllers/appbar_controller.dart';
import 'package:portfolio_flutter/utils/color_utils.dart';


class AppBar1 extends StatefulWidget {
  final index ;
  final pageController;
  const AppBar1({ Key? key ,this.index,this.pageController}) : super(key: key);

  @override
  State<AppBar1> createState() => _AppBar1State();
}

class _AppBar1State extends State<AppBar1> {

  @override
  void initState() {
    currentAppBarIndex.value = widget.index ?? 0;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // double _width = MediaQuery.of(context).size.width;
    return  ValueListenableBuilder(
      valueListenable: currentAppBarIndex,
      builder:(ctx,currentIndex,_)=>  Container(
        // height: 65.h,
        padding: EdgeInsets.only(right: 10.w,top: 0.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              black,
              black30,
              black54,
              
            ]
          ),
        
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.11),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.h),
            bottomLeft: Radius.circular(10.h)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            ListView.separated(
              itemCount: listOfMenu.length,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>  SizedBox(width: 10.w,),
              shrinkWrap: true,
              // padding: EdgeInsets.symmetric(horizontal: _width * .024),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  
                      // currentAppBarIndex.value = index;    
                      widget.pageController.animateToPage(
                       index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear, 
                      );
                      // _onItemTapped(currentAppBarIndex.value);             
                    
                  
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        listOfMenu[index], style: jostMedium( currentAppBarIndex.value == index ? white : grey, currentAppBarIndex.value == index ? 4.sp : 3.sp),
                      ), 
                    ),
                    // SizedBox(height: 2.h,),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == currentAppBarIndex.value ? 18.h : 25.h,
                      ),
                      width: 40.w,
                      height: index == currentAppBarIndex.value ? 1.h : 0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE75D1D),
                        borderRadius: BorderRadius.circular(
                          10.r
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> listOfMenu = [
    "HOME",
    "ABOUT",
    "SKILLS",
    "EXPERIENCES",
    "WORK",
    "CONTACT"
  ];
}