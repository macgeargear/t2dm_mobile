import 'package:flutter/material.dart';
import 'package:t2dm_mobile/core/theme/app_color.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColor.purple),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(395, 35),
            backgroundColor: AppColor.transparent,
            shadowColor: AppColor.transparent),
        child: Text(
          buttonText,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: AppColor.white),
        ),
      ),
    );
  }
}
