import 'package:flutter/material.dart';
import 'package:t2dm_mobile/core/theme/app_color.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Wannoi',
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: AppColor.purple01),
        ),
        const Text('the best health care platform',
            style: TextStyle(fontSize: 20, color: AppColor.purple02)),
        const SizedBox(height: 40),
        Image.asset(
          'assets/images/wannoi_logo.png',
          width: 277,
          height: 277,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
