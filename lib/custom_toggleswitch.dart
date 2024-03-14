library custom_toggleswitch;

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatefulWidget {
  final OnToggle? onToggle;
  final String label1;
  final String label2;
  final Color? inactiveBgColor;
  final Color? inactiveFgColor;
  final Color? activeFgColor;
  final Color? containerColor;
  final int? initialLabelIndex;
  const CustomToggleSwitch({
    super.key,
    this.onToggle,
    required this.label1,
    required this.label2,
    this.inactiveBgColor = Colors.white,
    this.inactiveFgColor = Colors.black,
    this.activeFgColor = Colors.white,
    this.initialLabelIndex = 0,
    this.containerColor = Colors.white ,
  });

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: widget.containerColor,
      ),
      height: MediaQuery.of(context).size.height * .066,
      width: MediaQuery.of(context).size.width-41,
      padding: const EdgeInsets.all(2),
      child: ToggleSwitch(
          centerText: true,
          fontSize: 15,
          minWidth: MediaQuery.of(context).size.width / 2 - 23,
          cornerRadius: 3,
          radiusStyle: true,
          activeBgColor: const [
            Color(0xff01C09B),
            Color(0xff01A182),
          ],
          customTextStyles: const [
            TextStyle(fontFamily: 'Gilroy SemiBold', fontSize: 16),
          ],
          inactiveBgColor: widget.inactiveBgColor,
          inactiveFgColor: widget.inactiveFgColor, //blackColor,
          activeFgColor: widget.activeFgColor, //whiteColor,
          initialLabelIndex: widget.initialLabelIndex, //toggleValue,
          totalSwitches: 2,
          labels: [
            widget.label1,
            widget.label2,
          ],
          onToggle: widget.onToggle),
    );
  }
}
