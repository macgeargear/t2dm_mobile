import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2dm_mobile/core/theme/app_color.dart';
import 'package:t2dm_mobile/core/utils/show_snackbar.dart';
import 'package:t2dm_mobile/features/auth/presentation/auth/auth_bloc.dart';
import 'package:t2dm_mobile/features/auth/presentation/widgets/auth_button.dart';
import 'package:t2dm_mobile/features/auth/presentation/widgets/auth_field.dart';
import 'package:t2dm_mobile/features/auth/presentation/widgets/auth_header.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignInPage());

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          // if (state is AuthLoading) {
          //   return const Loader();
          // }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AuthHeader(),
                    Column(
                      children: [
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
                        AuthButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          buttonText: 'Sign In',
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, SignInPage.route());
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: 'Don\' have an account? ',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  children: [
                                TextSpan(
                                    text: 'Sign Up',
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
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
