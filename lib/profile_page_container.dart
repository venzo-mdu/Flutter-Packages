library profile_page_container;

import 'package:flutter/material.dart';

class ProfilePageContainer extends StatefulWidget {
  final String text;
  final Image containerImage;
  final Color? iconContainerColor;
  final Color? containerColor;
  final bool useGradient;
  final Color? iconContainerGradientColor1;
  final Color? iconContainerGradientColor2;
  final GestureTapCallback? onTap;

  const ProfilePageContainer({
    super.key,
    required this.text,
    required this.containerImage,
    this.iconContainerColor = const Color(0xffF5CF43),
    required this.useGradient,
    this.iconContainerGradientColor1 = const Color(0xffF5CF43),
    this.iconContainerGradientColor2 = const Color(0xffFDC04A),
    this.onTap, this.containerColor,
  });

  @override
  State<ProfilePageContainer> createState() => _ProfilePageContainerState();
}

class _ProfilePageContainerState extends State<ProfilePageContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.containerColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .050,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff01B795),
                              Color(0xff018F73),
                            ],
                          ),
                        ),
                        child: widget.containerImage,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .036,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.text,
                            style: const TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Gilroy Medium'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.useGradient ? null : widget.iconContainerColor,
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: widget.useGradient ? LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                widget.iconContainerGradientColor1!,
                                widget.iconContainerGradientColor2!,
                              ],
                            ):null,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
