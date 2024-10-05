import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2dm_mobile/features/auth/domain/entities/user.dart';
import 'package:t2dm_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class ClinicalInfoPage extends StatelessWidget {
  const ClinicalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clinical Data 🫁'),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthSuccess) {
              // Get the user information from the AuthSuccess state
              User user = state.user;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Firstname: '),
                      Text(user.firstname),
                      const Text('Lastname: '),
                      Text(user.lastname),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            } else if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(child: Text('No user data available'));
          },
        ));
  }
}
