import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t2dm_mobile/core/theme/app_color.dart';
import 'package:t2dm_mobile/features/auth/presentation/pages/signup_page.dart';
import 'package:t2dm_mobile/features/auth/presentation/widgets/auth_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Wannoi',
                  style: GoogleFonts.inriaSans(
                      textStyle: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: AppColor.purple01)),
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
            ),
            AuthButton(
              onPressed: () {
                Navigator.push(context, SignUpPage.route());
              },
              buttonText: 'Get Started',
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}
