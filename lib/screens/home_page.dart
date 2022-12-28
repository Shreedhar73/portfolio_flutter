import 'dart:async';
import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/controllers/appbar_controller.dart';
import 'package:portfolio_flutter/screens/about_me.dart';
import 'package:portfolio_flutter/screens/contacts_screen.dart';
import 'package:portfolio_flutter/screens/experience_page.dart';
import 'package:portfolio_flutter/screens/landing.dart';
import 'package:portfolio_flutter/screens/skills_page.dart';
import 'package:portfolio_flutter/screens/works_page.dart';
import 'package:portfolio_flutter/utils/color_utils.dart';
import 'package:portfolio_flutter/widgets/appbar_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool brightness = true;
  var currentPage = 0;
  // var current = 0;
  PageController _pageController = PageController();
  late final AnimationController _appBarAnim = AnimationController(
    duration: const Duration(milliseconds: 1500),
    lowerBound: 0.35,
    upperBound: 1,
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0,-1),
    end: const Offset(0,0),
  ).animate(
    CurvedAnimation(
      parent: _appBarAnim,
      curve: Curves.easeInOutBack,
  ));

  final sink = StreamController<double>();

  @override
  void dispose() {
    _appBarAnim.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,

    );

     throttle(sink.stream).listen((offset) {
      _pageController.animateTo(
        offset,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              black,
              black30,
              // black54
            ]
          )
        ),
        child: Scaffold(
          backgroundColor: transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            // child: AppBar1(pageController: _pageController),
            child: SlideTransition(
              position: _offsetAnimation,
              child:  AppBar1(pageController: _pageController,)
            )
          ), 
          body: Listener(
            onPointerSignal: _handlePointerSignal,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              scrollBehavior: AppScrollBehaviour(),
              itemCount: listOfScreen.length,
              padEnds: true,
              pageSnapping: true,
              onPageChanged: (value) => {
                value == 0 ? _appBarAnim.reverse() : _appBarAnim.forward(),
                currentAppBarIndex.value = value,
                currentPage = value,
              },
              itemBuilder :(ctx,idx){
                return listOfScreen[idx];
              }
            ),
          ),
        ),
      ),
    );
  }

    Stream<double> throttle(Stream<double> src) async* {
    double offset = _pageController.position.pixels;
    DateTime dt = DateTime.now();
    await for (var delta in src) {
      if (DateTime.now().difference(dt) > Duration(milliseconds: 200)) {
        offset = _pageController.position.pixels;
      }
      dt = DateTime.now();
      offset += delta;
      yield offset;
    }
  }

  void _handlePointerSignal(PointerSignalEvent e) {
    if (e is PointerScrollEvent && e.scrollDelta.dy != 0) {
      sink.add(e.scrollDelta.dy);
    }
  }

}

var listOfScreen = const [
 
  LandingScreen(),
  AboutMe(),
  SkillsPage(),
  ExperiencesPage(),
  WorkPages(),
  ContactsPage(),
];

class AppScrollBehaviour extends MaterialScrollBehavior{
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.trackpad,
    PointerDeviceKind.mouse
  };
}

class _IgnorePointerSignal extends SingleChildRenderObjectWidget {
  _IgnorePointerSignal({Key? key, Widget? child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(_) => _IgnorePointerSignalRenderObject();
}

class _IgnorePointerSignalRenderObject extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {Offset? position}) {
    final res = super.hitTest(result, position: position!);
    result.path.forEach((item) {
      final target = item.target;
      if (target is RenderPointerListener) {
        target.onPointerSignal = null;
      }
    });
    return res;
  }
}

