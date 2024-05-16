import 'package:authentication_repository/authentication_repository.dart';
import 'package:fair_and_square/login/view/login_form.dart';
import 'package:fair_and_square/sign_up/view/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_and_square/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: BlocProvider(
                      create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
                      child: const LoginForm(),
                    ),
            ),
            const SizedBox(height: 16),
            GestureDetector( // Wrap with GestureDetector
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage()
                  )
                );
              },
              child: Text( // Use Text widget
                'New user? Click here to Sign Up',
                style: TextStyle(
                  color: Theme.of(context).primaryColor, // Use the primary color for text
                  decoration: TextDecoration.underline, // Underline the text
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
