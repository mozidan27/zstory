import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zstory/pages/forgot_pw_page.dart';
import 'package:zstory/pages/chat_page.dart';
import 'package:zstory/pages/profile_page.dart';
import 'package:zstory/pages/story_page.dart';
import 'package:zstory/services/auth/auth_gate.dart';
import 'package:zstory/firebase_options.dart';
import 'package:zstory/services/auth/loginOrRegister_page.dart';
import 'package:zstory/themes/dart_mode.dart';
import 'package:zstory/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ZStory());
}

class ZStory extends StatelessWidget {
  const ZStory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/forgot_Pw': (context) => const ForgotPasswordPage(),
        '/home_page': (context) => const ChatPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/story_page': (context) => const StoryPage(),
        '/login_register_page': (context) => const LoginOrRegisterPage(),
      },
    );
  }
}
