library custom_elevated_button;

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool isClicked;
  final Color circularProgressIndicatorColor;
  final Color buttonFontColor;
  final Color? buttonColor;
  final String buttonText;
  final double? fontSize;
  final double? height;
  final double? width;
  final String? fontFamily;
  final Decoration? decoration;

  const CustomElevatedButton({
    super.key,
    this.onTap,
    required this.isClicked,
    this.circularProgressIndicatorColor = const Color(0xff152841),
    required this.buttonFontColor,
    required this.buttonText,
    this.fontSize = 18,
    this.fontFamily = 'Gilroy Medium',
    this.buttonColor,
    this.decoration,
    this.height = 50,
    this.width =300,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfff6cc44),
                Color(0xffffb200),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
            child: isClicked
                ? CircularProgressIndicator(
                    color: circularProgressIndicatorColor,
                  )
                : Text(
                    buttonText,
                    style: TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: buttonFontColor),
                  )),
      ),
    );
  }
}
