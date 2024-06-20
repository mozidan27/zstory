import 'package:flutter/material.dart';
import 'package:zstory/helper/helper_functions.dart';
import 'package:zstory/services/auth/auth_services.dart';
import 'package:zstory/widgets/my_button.dart';
import 'package:zstory/widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pWController = TextEditingController();

// login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();
    // show loading cricle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    // try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pWController.text);
      Navigator.pop(context);
    } catch (e) {
      // pop loading circle
      Navigator.pop(context);
      // show the error message to user
      displayMessageToUser(e.toString(), context);
    }
  }

  // initially hide the password

  bool securePassword = true;

  // show and hide the passowrd

  void showOrHidePw() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.person,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),

            // welcome text
            const Text(
              'Z S T O R Y',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 28),
            ),
            const SizedBox(
              height: 25,
            ),

            // email text field
            MyTextField(
              controller: _emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),

            // password text field
            MyTextField(
              controller: _pWController,
              hintText: 'Password',
              obscureText: securePassword,
              suffixIcon: securePassword
                  ? IconButton(
                      onPressed: showOrHidePw,
                      icon: Icon(
                        Icons.visibility,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    )
                  : IconButton(
                      onPressed: showOrHidePw,
                      icon: Icon(
                        Icons.visibility_off,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
            ),
            const SizedBox(
              height: 15,
            ),

            // forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),

            // login button
            MyButton(
              onTap: () => login(context),
              text: 'Login',
            ),
            const SizedBox(
              height: 25,
            ),

            // don't have an account , register here

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have and account? '),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Register Here',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
