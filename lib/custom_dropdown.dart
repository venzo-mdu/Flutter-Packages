library custom_dropdown;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustonDropdown extends StatefulWidget {
  bool isVisible;
  final Function() onClick;
  final Function() onClose;
  bool isStrechedDropDown;
  final List dropdownList;
  String dropdownTitle;

  CustonDropdown({
    super.key,
    this.isVisible = false,
    this.isStrechedDropDown = false,
    this.dropdownTitle = 'Credit/Debit',
    required this.dropdownList,
    required this.onClick, required this.onClose,
  });

  @override
  State<CustonDropdown> createState() => _CustonDropdownState();
}

class _CustonDropdownState extends State<CustonDropdown> {
  LayerLink layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Stack(children: [
        Container(
          width: 150,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      border: !widget.isVisible
                          ? const Border(
                              top: BorderSide(color: Color(0xffE3E3E3)),
                              left: BorderSide(color: Color(0xffE3E3E3)),
                              right: BorderSide(color: Color(0xffE3E3E3)),
                              bottom: BorderSide(color: Color(0xffE3E3E3)),
                            )
                          : const Border(
                              top: BorderSide(color: Color(0xffFFBE78)),
                              left: BorderSide(color: Color(0xffFFBE78)),
                              right: BorderSide(color: Color(0xffFFBE78)),
                              bottom: BorderSide(color: Color(0xffFFBE78)),
                            ),
                      borderRadius: widget.isStrechedDropDown
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(22.5),
                              topRight: Radius.circular(22.5),
                            )
                          : const BorderRadius.all(Radius.circular(22.5)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          constraints: const BoxConstraints(
                            minHeight: 40,
                            minWidth: double.infinity,
                          ),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.isStrechedDropDown = !widget.isStrechedDropDown;
                                WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
                              });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        widget.dropdownTitle,
                                        style: const TextStyle(fontSize: 16, fontFamily: ' Gilroy Medium', color: Color(0xff5E5E5E)),
                                      ),
                                    ),
                                  ],
                                )),
                                Icon(
                                  widget.isStrechedDropDown ? Icons.expand_less : Icons.expand_more,
                                  color: !widget.isVisible ? const Color(0xffE3E3E3) : const Color(0xffFFBE78),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
        Container(
          child: Visibility(
            visible: widget.isVisible,
            child: Container(
              margin: const EdgeInsets.only(
                left: 135,
              ),
              decoration: const BoxDecoration(color: Color(0xffFF6349), shape: BoxShape.circle),
              child: InkWell(
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 18,
                ),
                onTap: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                    widget.dropdownTitle = "Credit/Debit";
                    hideOverlay();
                    widget.onClose();
                  });
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget dropdown() => Material(
        child: Container(
          margin: const EdgeInsets.only(right: 40),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(27), bottomRight: Radius.circular(27)),
            border: widget.isStrechedDropDown ? Border.all(color: const Color(0xffE3E3E3)) : Border.all(color: Colors.transparent),
          ),
          child: ExpandedSection(
            expand: widget.isStrechedDropDown,
            height: 100,
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: widget.dropdownList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.dropdownTitle = widget.dropdownList.elementAt(index);
                          hideOverlay();
                          widget.isVisible = true;
                          widget.isStrechedDropDown = false;
                          widget.onClick();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.dropdownList.elementAt(index),
                            style: const TextStyle(
                              fontFamily: 'Gilroy-Medium',
                              fontSize: 15,
                              color: Color(0xff5E5E5E),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // SvgPicture.asset('assets/svg/radioButton.svg'),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      );

  void showOverlay() {
    entry = OverlayEntry(
      builder: (context) => Positioned(width: 190, child: CompositedTransformFollower(link: layerLink, showWhenUnlinked: false, offset: const Offset(0, 42), child: dropdown())),
    );
    final overlay = Overlay.of(context);
    overlay?.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }
}

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final int height;
  final bool expand;

  const ExpandedSection({Key? key, this.expand = false, required this.child, required this.height}) : super(key: key);

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation,
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
        constraints: BoxConstraints(
          //minHeight: 100,
          minWidth: double.infinity,
          maxHeight: widget.height > 5
              ? 195
              : widget.height == 1
                  ? 55
                  : widget.height * 50.0,
        ),
        child: Padding(padding: const EdgeInsets.only(bottom: 5), child: widget.child),
      ),
    );
  }
}
