import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: onTap,
          child: const Text(
            "Story",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
