library custom_otp_field;

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class OtpField extends StatefulWidget {
  final PinTheme? defaultPinTheme;
  final int? length;
  final TextEditingController otpController;
  const OtpField({super.key,
    this.defaultPinTheme, this.length = 4, required this.otpController,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: widget.length!,
      controller: widget.otpController,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: widget.defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 10),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        setState(() {
          // otpValue = pin;
        });
      },
      onChanged: (value) {},
      cursor: Align(
        alignment: Alignment.center,
        child: Container(
          color: Colors.cyan,
          margin: const EdgeInsets.only(right: 9),
          width: 1,
          height: 30,
          // color: focusedBorderColor,
        ),
      ),
    );
  }
}
