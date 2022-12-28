
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/utils/color_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/social_icons.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: Material(
        elevation: 100,
        child: Container(
          height: kBottomNavigationBarHeight,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          color: black30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Designed and Developed by Shreedhar Pandeya", style: jostLight(white, 3.sp),),
              Text("Made with Flutter", style: jostLight(white, 3.sp),),
            ],
          ),
        ),
      ),
      body: Container(
        // color: black,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/social_icons/background2.jpg'),
            fit: BoxFit.cover,
            colorFilter: filter
          )
        ),
        // height: MediaQuery.of(context).size.height*2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.h,),
            Text("CONTACT ME",style: jostMedium(white, 4.sp),),
            SizedBox(height: 80.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Reach Me out on my Socials", style: gotu(white, 5.sp),),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SocialIcons(
                  image: 'assets/social_icons/linkedin.svg',
                  onTap: ()=>urlLaunch("https://www.linkedin.com/in/shreedhar-pandeya-1ba9ab152/"),
                ),
                SocialIcons(
                  image: 'assets/social_icons/twitter.svg',
                  onTap: ()=>urlLaunch("asd"),
                ),
                SocialIcons(
                  image: 'assets/social_icons/github.svg', color: white,
                  onTap: ()=>urlLaunch("asd"),
                ),
                SocialIcons(
                  image: 'assets/social_icons/instagram.svg',
                  onTap: ()=>urlLaunch("asd"),
                ),
                SocialIcons(
                  image: 'social_icons/gmail.svg',
                  onTap: (){
                    urlLaunch("mailto:shreedharpandey000@gmail.com");
                  },
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(),
                
                InkWell(
                  onTap: (){},
                  child: AnimatedTextKit(
                    onTap: () => urlLaunch("https://shreedhar007.com.np/images/myResume.pdf?i=1"),
                    animatedTexts:[
                      WavyAnimatedText(
                        "CLICK HERE TO DOWNLOAD MY CV", 
                        textStyle: gotu(white, 5.sp),
                        speed: const Duration(milliseconds: 300)
                      ),
                    ] 
                  ),
                ),
                
                SizedBox(width: 50.w,),
              ],
            ),
            SizedBox(height: 20.w,),
            
            
           
          ],
        ),
      ),
    );
  }
}
urlLaunch(url)async{
    // html.window.open(url.toString(),"_blank");
     await launchUrlString(
      url,
      // mode: LaunchMode.externalApplication,
    );
}


