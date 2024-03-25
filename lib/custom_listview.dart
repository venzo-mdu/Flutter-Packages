library custom_listview;

import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  final List<Column> content;
  final Color? containerColor;
  final ScrollPhysics? physics;
  final int numberOfContainer;

  const CustomListView({
    super.key,
    required this.content,
    this.physics = const NeverScrollableScrollPhysics(),
    this.containerColor = Colors.white,
    required this.numberOfContainer,
  });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final PageController _scrollController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      physics: widget.physics,
      itemCount: widget.numberOfContainer + (widget.numberOfContainer - 1),
      itemBuilder: (BuildContext context, int index) {
        int pageIndex = index % widget.numberOfContainer;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.containerColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  widget.content[pageIndex],
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFF5CF43),
                              Color(0xFFFDC14A),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * .019,
                        width: MediaQuery.of(context).size.width * .08,
                        child: Text(
                          '${pageIndex + 1}/${widget.numberOfContainer}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Gilroy Bold',
                            fontSize: 10.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onPageChanged: (int index) {
        // Handle looping logic when the page changes
        int newIndex;
        if (index == 0) {
          newIndex = widget.numberOfContainer;
        } else if (index == widget.numberOfContainer + 1) {
          newIndex = 1;
        } else {
          newIndex = index;
        }
        _scrollController.jumpToPage(newIndex);
      },
    );
  }
}
