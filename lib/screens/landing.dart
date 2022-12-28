import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/widgets/social_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:universal_html/html.dart' as html;
// import 'dart:html' as html;

import '../utils/color_utils.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              pause: const Duration(seconds: 2),
              animatedTexts: [
                TypewriterAnimatedText(" Shreedhar Pandeya. ", textStyle: gotu(white, 8.sp),speed: const Duration(milliseconds: 100))
              ]
            ),
            SizedBox(height: 10.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SocialIcons(
                  image: 'assets/social_icons/flutter.svg',
                  onTap: ()=>urlLaunch("https://www.linkedin.com/in/shreedhar-pandeya-1ba9ab152/"),
                ),
                SocialIcons(
                  image: 'assets/social_icons/firebase.svg',
                  onTap: ()=>urlLaunch("asd"),
                ),
                SocialIcons(
                  image: 'assets/social_icons/javascript.svg',
                  onTap: ()=>urlLaunch("asd"),
                ),
                SocialIcons(
                  image: 'assets/social_icons/mongodb.svg',
                  onTap: ()=>urlLaunch("asd"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  urlLaunch(url)async{
    // html.window.open(url.toString(),"_blank");
     launchUrlString(
      url,
      // mode: LaunchMode.externalApplication,
    );
  }
}

