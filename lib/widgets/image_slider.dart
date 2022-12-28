// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/color_utils.dart';

List<Widget> carouselSlider(_con,context,imgList ){
  return  imgList.map((item) => 
        SizedBox(
        // margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              child: Image.network(
                item,
                width: MediaQuery.of(context).size.width, 
              )
          ),
      )
  );
}


class Carousel extends StatefulWidget {
  const Carousel({ Key? key, this.project,this.duration = 500 }) : super(key: key);
  final project;
  final duration;
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  var images;
  @override
  void initState() {
    images = widget.project['images'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //  height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width,
          color: blackColor,
          child: InkWell(
            onTap: (){
              context.pushTransparentRoute(AnimatedCarousel(data: images,currentIndex: _current,)); 
            },
            child: CarouselSlider(
                  items: [
                    ...images.map((item)=> SizedBox(
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                            child: Image.network(
                              item,
                              width: MediaQuery.of(context).size.width, 
                              fit: BoxFit.cover,
                            )
                        ),
                    ) ),
                  ],
                  carouselController: _controller,
                  options: CarouselOptions(
                    padEnds: false,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(microseconds: widget.duration),
                    viewportFraction: 1,
                      aspectRatio: 3/2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }
                  ),
            ),
          ),
        ),
        Positioned(
          bottom: 5.w,
          left: 5.w,
          child:Text(
            widget.project['description'],style: jostMedium(greyish, 2.sp),
          )  ,
        ),

        Positioned(
          top: 10.0,
          left: 5.w,
          right: 5.w,
          child: Text(
            widget.project['name'],style: jostMedium(white, 2.sp),
          ) 
        ),
    ],
    );
  }
}

class AnimatedCarousel extends StatefulWidget {
  const AnimatedCarousel({ Key? key,this.data,this.currentIndex = 0 }) : super(key: key);
  static const routeName = '/animatedCarousel';
  final dynamic data;
  final dynamic currentIndex;
  @override
  State<AnimatedCarousel> createState() => _AnimatedCarouselState();
}

class _AnimatedCarouselState extends State<AnimatedCarousel> {
  var imageList = [];
  PageController pageViewController = PageController();
  @override
  void initState() {
    imageList = widget.data;
    pageViewController = PageController(initialPage: widget.currentIndex);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: (){
        Navigator.pop(context);
      },
      behavior: HitTestBehavior.translucent,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Stack(
            children: [
                PhotoViewGallery.builder(
                  scrollPhysics: const ClampingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      maxScale: PhotoViewComputedScale.contained * 4,
                      minScale: PhotoViewComputedScale.contained * 1,
                      initialScale: PhotoViewComputedScale.contained * 1,
                      imageProvider: NetworkImage(imageList[index % imageList.length]),
                      errorBuilder: (context, url,_)=>Image.asset(
                        'assets/images/placeholder.jpg',
                        width: 360.sp,
                        height: 100.sp,
                        fit: BoxFit.contain,
                      ),
                      // heroAttributes: PhotoViewHeroAttributes(tag: imageList[index]),
                    );
                  },
                  itemCount: imageList.length,
                  loadingBuilder: (context, event) =>  Center(
                    child: SizedBox(
                      width: 60.0.sp,
                      height: 60.0.sp,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  backgroundDecoration: const BoxDecoration(
                    color: black,
                  ),
                  pageController: pageViewController,
                ),
                //current index indicator
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: SmoothPageIndicator(  
                        controller: pageViewController,
                        count: imageList.length,  
                        
                        effect: ExpandingDotsEffect(
                          activeDotColor: white,
                          dotColor: grey.withOpacity(0.3),
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 2
                        ) 
                    ),
                  ),
                ),
                //close button
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 5.sp,right: 10.sp),
                    decoration: BoxDecoration(
                      color: black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      // padding: const EdgeInsets.all(0),
                      onPressed: ()=> Navigator.pop(context), 
                      icon: const Icon(Icons.close,color: white,size: 30,)
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}