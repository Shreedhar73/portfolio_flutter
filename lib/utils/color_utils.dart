import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Color(0xffffffff);
const white45 = Colors.white54;
const white60 = Colors.white60;
const white70 = Colors.white70;
const grey = Color(0xff959595);
const grey2 = Color(0xff9B9B9B);
const greyish = Color(0xffD9D9D9);
const darkDotColor = Color(0Xff7B7B7B);
const black = Color(0xff121212);
const black30 = Color(0xff303030);
const black54 = Colors.black54;
const black87 = Colors.black87;
const blackColor = Colors.black;
const tappedColor = Color(0xff9F703A);
const blue = Colors.blue;
const red = Color(0xffB91B33);
const green = Color.fromARGB(255, 0, 197, 75);
const orange = Color(0xffE75D1D);
const switchActiveColor =  Color(0xff707070);//tabselection color
const dividerColor= Color(0xffE8E8E8);
const categoryColor = Color(0xffF2F2F2);
const carouselDotColor = Color(0xffE7E7E7);
const textFieldBorderColor = Color(0xff3F3F3F);
const loginColor1 = Color(0xff707070);
const transparent = Colors.transparent;
const activbityblack = Color(0xff383838);
const activbitygreen = Color(0xff114234);
Color semiTranslucent = black.withOpacity(0.4);

// var appbarFontStyle = GoogleFonts.gotu(fontSize: 15.sp,color: white,fontWeight: FontWeight.w500,letterSpacing: 0.15);
// var bodyRFontStyle = GoogleFonts.gotu(fontSize: 15.sp,color: white,fontWeight: FontWeight.w500,letterSpacing: 0.15);


var jostRegularWhite = GoogleFonts.jost(fontSize: 13.sp,color: white,fontWeight:  FontWeight.w400,letterSpacing: 0.13);
var gotuRegular = GoogleFonts.gotu(fontSize:18.sp,fontWeight:  FontWeight.w400,letterSpacing: 0.36);
gotu(color,double fontsize) => GoogleFonts.gotu(fontSize:fontsize.sp,fontWeight:FontWeight.w400,color: color,letterSpacing: 0.36,textStyle: const TextStyle(letterSpacing: 0.36,height: 1.5));
jostRegular(color,double fontsize) => GoogleFonts.jost(fontSize: fontsize.sp,color: color,fontWeight:  FontWeight.w400,letterSpacing: 0.13);
jostMedium(color, double fontsize) => GoogleFonts.jost(fontSize : fontsize.sp,fontWeight:  FontWeight.w500,color: color,letterSpacing: 0.6);
jostLight(color,double fontsize) => GoogleFonts.jost(fontSize: fontsize.sp,fontWeight:  FontWeight.w300,color: color,letterSpacing: 0);
jostSemiBold(color,double fontsize) => GoogleFonts.jost(fontSize: fontsize.sp,fontWeight:  FontWeight.w400,color: color,letterSpacing: 0.6);
jostMediumUnderLine(color, double fontsize) => GoogleFonts.jost(fontSize : fontsize.sp,fontWeight:  FontWeight.w500,color: color,letterSpacing: 0.5,
  decoration: TextDecoration.lineThrough,
  decorationThickness: 3,
  decorationColor: black.withOpacity(0.8),
  decorationStyle: TextDecorationStyle.solid
);

const grey13 = TextStyle(
  color: grey,
  fontSize: 13.0
);
const gold13 = TextStyle(
  color: Color(0xff9F703A),
  fontSize: 13.0
);
const black13 = TextStyle(
  color: Color(0xff121212),
  fontSize: 13.0
);
const white13 = TextStyle(
  color: Color(0xfff9f9f9),
  fontSize: 13.0
);


Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return tappedColor;
}

ColorFilter filter = ColorFilter.mode(
  green.withOpacity(0.4),
  BlendMode.multiply
);