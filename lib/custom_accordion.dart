library custom_accordion;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAccordion extends StatefulWidget {

  bool expand;
  final int? index;
  final Column child;
  final String title;

  CustomAccordion({
    super.key,
    this.expand = false,
    this.index,
    required this.child,
    required this.title,
  });

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.expand = !widget.expand;
        });
      },
      child: ExpandableListView(
        isExpanded: widget.expand ,
        // isExpanded: widget.index == widget.tapped ? !widget.expand : false,
        title: widget.title,
        child: widget.child,
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final Function()? onStatusComplete;
  final bool isExpanded;
  final Column child;
  final String title;

  const ExpandableListView({
    super.key,
    this.onStatusComplete,
    required this.isExpanded,
    required this.child,
    required this.title,
  });

  @override
  State<ExpandableListView> createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Gilroy SemiBold',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return RotationTransition(
                          turns: animation,
                          child: child,
                        );
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: const Color(0xffECECEC),
                        key: Key(widget.isExpanded.toString()), // Key to differentiate between widgets
                        // child:widget.isExpanded ?
                        // const Icon(Icons.expand_less) :
                        // const Icon(Icons.expand_more),

                        child: widget.isExpanded ? SvgPicture.asset('assets/images/svg/taskicon.svg') : SvgPicture.asset('assets/images/svg/taskicon1.svg'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          ExpandableContainer(
            expanded: widget.isExpanded,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                  ),
                  Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 5.5),
                      child: widget.child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final Widget child;

  const ExpandableContainer({
    super.key,
    required this.child,
    this.collapsedHeight = 0.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double expandedHeight = height * .19;
    double expandHeightSmallScreen = height * 0.15;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.width,
      height: expanded ? (height > 690.0 ? expandedHeight : expandHeightSmallScreen) : collapsedHeight,
      child: Container(
        child: child,
      ),
    );
  }
}
