import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/image_slider.dart';

class ProjectWidet extends StatefulWidget {
  const ProjectWidet({Key? key,this.project}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final project;

  @override
  State<ProjectWidet> createState() => _ProjectWidetState();
}

class _ProjectWidetState extends State<ProjectWidet> with TickerProviderStateMixin {
   late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    lowerBound: 0.6,
    upperBound: 1,
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {} ,
      child: MouseRegion(
        onHover: (event) => _controller.forward(),
        onExit: (event) => _controller.reverse(),
        child: ScaleTransition(
          scale: _animation,
          child: SizedBox(
            // height: 100.h,
            child: Carousel(
              project: widget.project,
            ),
          ),
          // child: Container(
          // // height: 40.h,
          // // width: 40.h,
          // decoration: ShapeDecoration(
          //   shape: const RoundedRectangleBorder(),
          //   image: DecorationImage(
          //     image: NetworkImage(widget.project["images"][0]),
          //     colorFilter: ColorFilter.mode(
          //       black.withOpacity(0.6),
          //       BlendMode.multiply
          //     ),
          //     fit: BoxFit.cover
          //   ),
          // ),
          // padding: EdgeInsets.all(2.sp),
          // child: Stack(
          //   children: [
          //     Align(
          //       alignment: Alignment.topCenter,
          //       child: Text(
          //         widget.project['name'],
          //         style: gotu(greyish, 5.sp),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Text(
          //         widget.project['description'],
          //         style: jostMedium(white, 4.h),
          //       ),
          //     )
          //   ],
          // ),
          // ),
        ),
      ),
    );
  }
}

var projectsList = [
  {
    "name" : "Project 1",
    "description" : "Project 1 Description, This is the description of projcet 1",
    "images" : [
      "https://images.unsplash.com/photo-1586281380117-5a60ae2050cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      "https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
      "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    ]
  },
  {
    "name" : "Project 2",
    "description" : "Project 2 Description, This is the description of projcet 2",
    "images" : [
      "https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
      "https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
      "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    ]
  },
  {
    "name" : "Project 1",
    "description" : "Project 1 Description, This is the description of projcet 1",
    "images" : [
      "https://images.unsplash.com/photo-1586281380117-5a60ae2050cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      "https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
      "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    ]
  },
  {
    "name" : "Project 1",
    "description" : "Project 1 Description, This is the description of projcet 1",
    "images" : [
      "https://images.unsplash.com/photo-1586281380117-5a60ae2050cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      "https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
      "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    ]
  },
  {
    "name" : "Project 1",
    "description" : "Project 1 Description, This is the description of projcet 1",
    "images" : [
     "https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
      "https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
      "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    ]
  },
  
];