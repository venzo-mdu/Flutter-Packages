library custom_snackbar;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar(String textValue) {
  Get.snackbar(
      duration: const Duration(milliseconds: 1200),
      messageText: Text(
        textValue,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Gilroy SemiBold',
          fontSize: 18,
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: const Color(0xffFCB710),
      snackPosition: SnackPosition.TOP,
      '\n',
      textValue);
}


