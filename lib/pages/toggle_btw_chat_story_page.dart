import 'package:flutter/material.dart';
import 'package:zstory/pages/chat_page.dart';
import 'package:zstory/pages/story_page.dart';

class StoryOrChatPage extends StatefulWidget {
  const StoryOrChatPage({super.key});

  @override
  State<StoryOrChatPage> createState() => _StoryOrChatPageState();
}

class _StoryOrChatPageState extends State<StoryOrChatPage> {
  // initially show chat page
  bool showChatPage = true; // Use camelCase for variable names

  // toggle between chat & story page
  void chatOrStoryToggle() {
    setState(() {
      showChatPage = !showChatPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showChatPage) {
      return ChatPage(
        onTap: chatOrStoryToggle,
      );
    } else {
      return StoryPage(
        onTap: chatOrStoryToggle,
      );
    }
  }
}
