import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2dm_mobile/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:t2dm_mobile/core/theme/theme.dart';
import 'package:t2dm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:t2dm_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:t2dm_mobile/features/summary/presentation/summary_page.dart';
import 'package:t2dm_mobile/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => serviceLocator<AuthBloc>()..add(AuthAutoLogin())),
    BlocProvider(create: (_) => serviceLocator<AppUserCubit>())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T2DM',
      theme: AppTheme.lightMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(selector: (state) {
        return state is AppUserLoggedIn;
      }, builder: (context, state) {
        if (state) {
          return const SummaryPage();
        }
        return const LoginPage();
      }), // add bloc selector
    );
  }
}
