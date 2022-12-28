import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/utils/color_utils.dart';
import 'package:portfolio_flutter/widgets/skill_widget.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> with TickerProviderStateMixin{
  late final AnimationController _firstBox = AnimationController(
    duration: const Duration(milliseconds: 1500),
    lowerBound: 0.35,
    upperBound: 1,
    vsync: this
  );
  late final AnimationController _secondBox = AnimationController(
    duration: const Duration(milliseconds: 1500),
    lowerBound: 0.35,
    upperBound: 1,
    vsync: this
  );
  late final AnimationController _thirdBox = AnimationController(
    duration: const Duration(milliseconds: 1500),
    lowerBound: 0.35,
    upperBound: 1,
    vsync: this
  );
  late final Animation<Offset> _offset1 = Tween<Offset>(
    begin: Offset(0.6.w,8.h),
    end:  Offset(0.2.w,0.05.h),
  ).animate(
    CurvedAnimation(
      parent: _firstBox,
      curve: Curves.easeInOutBack,
  ));
  late final Animation<Offset> _offset2 = Tween<Offset>(
    begin:  Offset(2.w,-12.h),
    end:  Offset(0.7.w,0.05.h),
  ).animate(
    CurvedAnimation(
      parent: _secondBox,
      curve: Curves.easeInOutCirc,
  ));
  late final Animation<Offset> _offset3 = Tween<Offset>(
    begin: Offset(6.w,100.h),
    end: Offset(-0.2.h,0.8.h),
  ).animate(
    CurvedAnimation(
      parent: _secondBox,
      curve: Curves.easeInOutCirc,
  ));

  @override
  void initState() {
    _firstBox.forward();
    _secondBox.forward();
    _thirdBox.forward();
    super.initState();
  }
 

  @override
  void dispose() {
    // _firstBox.dispose();
    // _secondBox.dispose();
    // _thirdBox.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 0.h),
      // height: MediaQuery.of(context).size.height,
      decoration:  ShapeDecoration(
        shape: const RoundedRectangleBorder(),
        image: DecorationImage(
          image: const AssetImage(
            "social_icons/background.jpg",
          ),
          fit: BoxFit.cover,
          colorFilter: filter
        )
        
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h,),
          Text(
            "Skills",
            style: gotu(white, 5.sp),
          ),
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                position: _offset1,
                child: skillWidget(languages, "LANGUAGE")
              ),
              SlideTransition(
                position: _offset2,
                child: skillWidget(frameworks, "FRAMEWORKS")
              ),
              SlideTransition(
                position: _offset3,
                child: skillWidget(tools, "TOOLS")
              ),
            ],
          ),
        ],
      ),
    );
  }
}