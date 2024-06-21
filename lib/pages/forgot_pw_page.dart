import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zstory/helper/helper_functions.dart';
import 'package:zstory/services/auth/auth_services.dart';
import 'package:zstory/widgets/my_button.dart';
import 'package:zstory/widgets/my_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void passwordRest(BuildContext context) async {
    // auth service
    final auth = AuthService();

    // try to send the reset link
    try {
      await auth.resetPassword(_emailController.text.trim());
      displayMessageToUser(
          'Reset link has been sent, Please check your email.', context);
    } on FirebaseAuthException catch (e) {
      // Display the specific error message from FirebaseAuthException
      displayMessageToUser(e.message ?? 'An error occurred.', context);
    } catch (e) {
      // Display a generic error message if the error is not a FirebaseAuthException
      displayMessageToUser('An unknown error occurred.', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          // welcome image
          const Center(
            child: Image(
              image: AssetImage('lib/assets/login-punch.png'),
              height: 300,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // welcome page text
          const Text(
            'Forgot your password? Don\'t worry, I\'m here to help, please enter your email.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // text field to reset the password
          MyTextField(
              controller: _emailController,
              hintText: 'Enter Your Email',
              obscureText: false),
          const SizedBox(
            height: 30,
          ),

          // icon button

          MyButton(
            text: 'Reset Password',
            onTap: () => passwordRest(context),
          )
        ],
      ),
    );
  }
}
