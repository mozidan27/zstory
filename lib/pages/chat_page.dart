import 'package:flutter/material.dart';
import 'package:zstory/widgets/my_drawer.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: GestureDetector(
          onTap: onTap,
          child: const Text(
            "Chats",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
          ),
        ),
        centerTitle: false,
      ),
      endDrawer: const MyDrawer(),
    );
  }
}
