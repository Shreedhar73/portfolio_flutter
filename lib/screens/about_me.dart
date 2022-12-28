import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_utils.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/social_icons/background2.jpg'),
            fit: BoxFit.cover,
            colorFilter: filter
          )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.35,
                decoration: ShapeDecoration(
                  // color: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.sp),
                    side: const BorderSide(
                      style: BorderStyle.solid,
                      color: grey
                    ),
                  ),

                ),
                
                child: Center(child: Text("I primarily create Cross Platform Mobile Application using Google's FLutter and also do a bit of server side scripting using Express.js.", style: jostMedium(white, 6.sp),),),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:  EdgeInsets.only(right:40.0.w),
                child: Image.asset('assets/social_icons/prog.png',fit: BoxFit.cover,),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: MediaQuery.of(context).size.height*0.58,
                width: MediaQuery.of(context).size.width*0.6,
                decoration: ShapeDecoration(
                  // color: red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.sp),
                    side: const BorderSide(
                      style: BorderStyle.solid,
                      color: grey
                    ),
                  )
                ),
                child: Center(
                  child: Text("    I recently completed my Bachelor's in Computer Science and Information from Madan Bhandari Memorial College, Anamnagar Kathmandu . Over the year i invested my fair share of time, in web development, to OOP programming, did fair bit of python coding to learning basics of Networking and Net Security. Finally I discovered my passion for Android development and did a bit of JS and React Native and finally shifting to developing Cross platform Applications with Google's Flutter. \n \n   As a developer, I enjoy bridging the gap between functionality and design. My goal is to always build applications that are scalable and efficient under the hood while providing engaging, pixel-perfect user experiences. In addition, I am highly responsive to client needs and also committed to helping people realize their vision.",
                    style: gotu(white, 5.sp),
                  ),
              ),
              ),
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: black,
    //   body: Padding(
    //     padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
    //     child: SizedBox(
    //       height: MediaQuery.of(context).size.height,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text("Hello", style: jostMedium(white, 5.sp),),
    //               Icon(Icons.handshake, color: green,size: 10.h,)
    //             ],
    //           ),
    //           // Row(
    //           //   mainAxisAlignment: MainAxisAlignment.center,
    //           //   crossAxisAlignment: CrossAxisAlignment.center,
    //           //   children: [
    //           //     Text('I am ',
    //           //       style: jostRegular(white, 3.sp),
    //           //     ),
    //           //     AnimatedTextKit(
    //           //       repeatForever: true,
    //           //       isRepeatingAnimation: true,
    //           //       animatedTexts: [
    //           //         TypewriterAnimatedText(" Shreedhar Pandeya. ", textStyle: gotu(white, 2.sp),speed: const Duration(milliseconds: 100))
    //           //       ]
    //           //     ),
    //           //   ],
    //           // ),
    //           Text('\n A Design Minded  ', style: jostRegular(white, 3.sp),),
    //           SizedBox(
    //             // height: 10.h,
    //             child: AnimatedTextKit(
    //               repeatForever: true,
    //               animatedTexts: [
    //                 RotateAnimatedText('[ PROGRAMMAR ]',textStyle: jostMedium(red.withOpacity(0.8), 2.sp), alignment: Alignment.center),
    //                 RotateAnimatedText('[ MOBILE APPLICATION DEVELOPER ]',textStyle: jostMedium(red.withOpacity(0.8), 2.sp),alignment: Alignment.center),
    //                 RotateAnimatedText('[ WEB DEVELOPER ]',textStyle: jostMedium(red.withOpacity(0.8), 2.sp),alignment: Alignment.center),
    //               ],
    //               onTap: () {
    //                 // print("Tap Event");
    //               },
    //             ),
    //           ),
    //           SizedBox(height: 5.h,),
    //           Text(" I primarily create Cross Platform Mobile Application using Google's FLUTTER \n and also do a bit of server side scripting using Express.js.",style: jostMedium(white, 5.sp),maxLines: 3,),
              
    //         ],
    //       ),
    //     ),
    //   )
    // );
  }
}