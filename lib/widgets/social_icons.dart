import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcons extends StatefulWidget {
  const SocialIcons({Key? key,this.image,this.color,this.onTap}) : super(key: key);
  final String? image;
  final VoidCallback? onTap;
  // ignore: prefer_typing_uninitialized_variables
  final color;

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    lowerBound: 0.35,
    upperBound: 1,
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  double scale = 50;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) => _controller.forward(),
        onExit: (event) => _controller.reverse(),
        child: InkWell(
          onTap: widget.onTap,
          child: ScaleTransition(
            scale: _animation,
            child: Row(
              children: [
                SizedBox(
                  child: SvgPicture.asset(widget.image!,color: widget.color,fit: BoxFit.fill,height: 50.h,)
                ),
                // SizedBox(width: 50.w,)
              ],
            ),
          ),
        ),
      );
  }
}