library custom_pageview;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPageView extends StatefulWidget {
  final int numberOfPages;
  final List<String> title;
  final List<Column> content;
  final Color? backButtonColor;
  final Color? containerColor;
  final TextStyle? titleStyle;
  final Function() backButtonClick;
  final ScrollPhysics? physics;
  final bool? usePhysics;
  final double? containerHeight;
  final double? containerWidth;

  const CustomPageView({
    super.key,
    required this.numberOfPages,
    required this.title,
    required this.content,
    this.backButtonColor = Colors.white,
    this.titleStyle = const TextStyle
      (fontFamily: 'Gilroy SemiBold', fontSize: 22, color: Colors.black),
    required this.backButtonClick,
    this.physics = const NeverScrollableScrollPhysics(),
    this.usePhysics = false,
     this.containerHeight = 460,
     this.containerWidth = 400,
    this.containerColor = Colors.white,
  });

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final _pageController = PageController(initialPage: 0);
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: widget.physics,
      controller: _pageController,
      itemCount: widget.numberOfPages, // Set the number of pages
      itemBuilder: (BuildContext context, int index) {
        // Return the container with desired modifications
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              GestureDetector(
                onTap: () {
                  if(index == 0){
                    widget.backButtonClick();
                  }
                  else{
                    _pageController.jumpToPage(index - 1);
                  }
                },
                child: SvgPicture.asset(
                  'assets/images/svg/signupArrow.svg',
                    color: widget.backButtonColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Container(
                height: widget.containerHeight,
                width: widget.containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: widget.containerColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: !widget.usePhysics! ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xff01BE99),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.center,
                        width: 36,
                        height: 20,
                        child: Text(
                          '${index + 1}/${widget.numberOfPages}',
                          style: const TextStyle(fontFamily: 'Gilroy Bold', fontSize: 10.0, color: Colors.white),
                        ),
                      ):Container(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.077,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(widget.title[index], style: widget.titleStyle
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.040,
                    ),
                    widget.content[index],
                    const Spacer(),
                    !widget.usePhysics! ? GestureDetector(
                      onTap: () {
                        setState(() {
                          if(widget.numberOfPages == index+1){
                            _pageController.jumpToPage(0);
                          }
                          else{
                            _pageController.jumpToPage(index + 1);
                          }
                        });
                      }, // Image tapped
                      child: SvgPicture.asset(
                        'assets/images/svg/right_arrow.svg',
                        height: 50,
                        width: 50,
                      ),
                    ):Container(
                      decoration: BoxDecoration(
                        color: Color(0xff01BE99),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      alignment: Alignment.center,
                      width: 36,
                      height: 20,
                      child: Text(
                        '${index + 1}/${widget.numberOfPages}',
                        style: const TextStyle(fontFamily: 'Gilroy Bold', fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
