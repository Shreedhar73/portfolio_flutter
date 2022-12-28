import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/utils/color_utils.dart';
import 'package:timelines/timelines.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({Key? key}) : super(key: key);

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/social_icons/background3.jpg'),
            fit: BoxFit.cover,
            colorFilter: filter
          )
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h,),
          Text("EXPERIENCES",style: gotu(white, 4.sp),),
          SizedBox(height: 10.h,),
          Expanded(
            child: Timeline.tileBuilder(
              builder: TimelineTileBuilder.fromStyle(
                itemCount: experiences.length,
                contentsAlign: ContentsAlign.alternating,
                // itemExtent: 35.h,
                contentsBuilder: (context, index) =>  experienceCard(experiences[index])
              
          
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget experienceCard(experience){
  return Card(
    // margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
    // height: 80,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(experience['company'],style: gotu(black, 3.5.sp,),),
          Text(experience['position'],style: gotu(black, 2.5.sp),),
          Text(experience['date'],style: gotu(black, 2.5.sp),),
        ],
      ),
    ),
  );
}

var experiences = [
  {
    "company" : "LeapFrog Technology",
    "position" : "Software Engineering Intern",
    "date" : "Dec 2020- Feb 2021"
  },
  {
    "company" : "ScholarSpace",
    "position" : "Flutter Developer",
    "date" : "Dec 2020- Feb 2021"
  },
  {
    "company" : "Miracle Interface",
    "position" : "Software Engineer I",
    "date" : "Dec 2020- Feb 2021"
  },
  {
    "company" : "Young Innovations PVT LTD",
    "position" : "Software Engineer I",
    "date" : "Dec 2020- Feb 2021"
  },
  
];