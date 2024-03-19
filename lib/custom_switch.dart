library custom_switch;
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveThumbColor;

  const CustomSwitch({
    super.key,
    required this.onChanged,
    required this.value,
    this.activeColor,
    this.inactiveThumbColor,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: widget.activeColor,
      inactiveThumbColor: widget.inactiveThumbColor,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}