

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/utils/color_utils.dart';
import 'package:portfolio_flutter/widgets/projects_widget.dart';

class WorkPages extends StatefulWidget {
  const WorkPages({Key? key}) : super(key: key);

  @override
  State<WorkPages> createState() => _WorkPagesState();
}

class _WorkPagesState extends State<WorkPages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/social_icons/background1.jpg'),
            fit: BoxFit.cover,
            colorFilter: filter
          )
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("PROJECTS",style: gotu(white, 4.sp),),
          Expanded(
            child: GridView.builder(
              itemCount: projectsList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3/2,
              ), 
              itemBuilder: (context, index) => ProjectWidet(project: projectsList[index],)
            ),
          ),
        ],
      ),
    );
  }
}

