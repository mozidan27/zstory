import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            onTap: () {},
          )
        ],
      ),
    );
  }
}
