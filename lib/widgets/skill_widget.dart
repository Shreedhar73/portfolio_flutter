import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfolio_flutter/utils/color_utils.dart';

Widget skillWidget(skillList,title,[ double height = 90,color=red]){
  return Container(
    // height: 90.h,
    width: 150.w,
    padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 20.w),
    // color: grey,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      color: red.withOpacity(0.2)
    ),
    child: Column(
      children: [
        Text(title, style: gotu(white, 4.sp),),
        ListView.builder(
          itemCount: skillList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => 
          Row(
            children: [
              Text(skillList[index]['name'],style: gotu(white, 4.sp),),
              SizedBox(
                // height: 10.sp,
                width: 45.w,
                child: LinearPercentIndicator(
                  alignment: MainAxisAlignment.center,
                  animation: true,
                  animationDuration: 2500,
                  restartAnimation: true,
                  clipLinearGradient: true,
                  backgroundColor: color,
                  percent: skillList[index]['percent'],
                  linearGradient: const LinearGradient(colors: [blue,white60]),
                ),
              ),
            ],
          ),
          
        ),
      ],
    ),
    
    
  );

}

var languages = [
  {"name" : "Dart", "percent":.85},
  {"name" : "JavaScript", "percent":.80},
  {"name" : "AJAX", "percent":.80},
  {"name" : "XML", "percent":.80},
  {"name" : "JSON", "percent":.80},
  {"name" : "HTML", "percent":.80},

];

var tools = [
  {"name" : "GIT", "percent":.85},
  {"name" : "MONGO DB", "percent":.80},
  {"name" : "POSTMAN", "percent":.80},
  {"name" : "HEROKU", "percent":.80},

];

var frameworks = [
  {"name" : "FLUTTER", "percent":.85},
  {"name" : "EXPRESS", "percent":.80},
  {"name" : "JQUERY", "percent":.80},
  {"name" : "BOOTSTRAP4", "percent":.80},
  {"name" : "API", "percent":.80},

];