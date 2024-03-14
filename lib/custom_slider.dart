library custom_slider;

import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final String? label;
  final int? divisions;
  final String sliderLabel;
  final Color? secondaryActiveColor;
  final TextEditingController sliderController;
  final InputDecoration? decoration;

  const CustomSlider({
    super.key,
    this.activeColor,
    this.max = 1.0,
    required this.onChanged,
    required this.value,
    this.min = 0.0,
    this.inactiveColor,
    this.label,
    this.secondaryActiveColor,
    this.divisions,
    required this.sliderLabel,
    required this.sliderController,
    this.decoration = const InputDecoration()
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  @override
  void initState() {
    super.initState();
    widget.sliderController.text = widget.value.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 30,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.sliderLabel,
              ),
              IntrinsicWidth(
                  child: TextField(
                    controller: widget.sliderController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ))
            ],
          ),
        ),
        Slider(
          secondaryActiveColor:widget.secondaryActiveColor,
          value: widget.value,
          max: widget.max,
          onChanged: widget.onChanged,
          label: widget.label,
          inactiveColor :widget.inactiveColor,
          activeColor: widget.activeColor,
          divisions: widget.divisions,
        )
      ],
    );
  }
}
