import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2dm_mobile/core/common/widgets/loader.dart';
import 'package:t2dm_mobile/core/theme/app_color.dart';
import 'package:t2dm_mobile/core/utils/show_snackbar.dart';
import 'package:t2dm_mobile/features/auth/presentation/auth/auth_bloc.dart';
import 'package:t2dm_mobile/features/auth/presentation/pages/signin_page.dart';
import 'package:t2dm_mobile/features/auth/presentation/widgets/auth_button.dart';
import 'package:t2dm_mobile/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text('Wannoi',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary)),
                        const Text('the best health care platform',
                            style: TextStyle(
                                fontSize: 20, color: AppColor.primary)),
                        const SizedBox(height: 300),
                        AuthField(
                            hintText: 'Username',
                            controller: usernameController),
                        const SizedBox(height: 15),
                        AuthField(
                          hintText: 'Password',
                          controller: passwordController,
                          isObscureText: true,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Column(
                        children: [
                          AuthButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {}
                            },
                            buttonText: 'Sign Up',
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, SignInPage.route());
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: 'Already have an account? ',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    children: [
                                  TextSpan(
                                      text: 'Sign In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.bold))
                                ])),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
