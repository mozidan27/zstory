import 'package:flutter/material.dart';
import 'package:zstory/helper/helper_functions.dart';
import 'package:zstory/services/auth/auth_services.dart';
import 'package:zstory/widgets/my_button.dart';
import 'package:zstory/widgets/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pWController = TextEditingController();
  final TextEditingController _confirmPWController = TextEditingController();

// signup method
  void registerUser(BuildContext context) async {
    //get auth service

    final auth = AuthService();
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // make sure passwords match
    if (_pWController.text != _confirmPWController.text) {
      // pop loading circle
      Navigator.pop(context);

      // show error message to user
      displayMessageToUser('Passwords don\'t match!', context);
    } else {
      // try creating the user
      try {
        // create the user
        await auth.signUPWithEmailAndPassword(_emailController.text,
            _pWController.text, _userNameController.text);
        // pop loading circle
        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        // pop loading cricle
        Navigator.pop(context);

        // show the error message to user
        displayMessageToUser(e.toString(), context);
        // pop loading cricle
      }
    }
  }

  // initially hide the password

  bool securePassword = true;
  bool secureConfirmPassword = true;

  // show and hide the passowrd

  void showOrHidePw() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void showOrHideConPW() {
    setState(() {
      secureConfirmPassword = !secureConfirmPassword;
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
            // User Name text field
            MyTextField(
              controller: _userNameController,
              hintText: 'User Name',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
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
                        Icons.visibility_off_outlined,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    )
                  : IconButton(
                      onPressed: showOrHidePw,
                      icon: const Icon(
                        Icons.visibility_outlined,
                        color: Color(0xFF90CAF9),
                      ),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            // confirm password text field
            MyTextField(
              controller: _confirmPWController,
              hintText: 'Confirm Password',
              obscureText: secureConfirmPassword,
              suffixIcon: secureConfirmPassword
                  ? IconButton(
                      onPressed: showOrHideConPW,
                      icon: Icon(
                        Icons.visibility_off_outlined,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    )
                  : IconButton(
                      onPressed: showOrHideConPW,
                      icon: const Icon(
                        Icons.visibility_outlined,
                        color: Color(0xFF90CAF9),
                      ),
                    ),
            ),
            const SizedBox(
              height: 15,
            ),

            //forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/forgot_Pw'),
                    child: const Text('Forgot Password?'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),

            // sign up button
            MyButton(
              onTap: () => registerUser(context),
              text: 'Sign Up',
            ),
            const SizedBox(
              height: 25,
            ),

            // already have an account , login now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login now',
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
