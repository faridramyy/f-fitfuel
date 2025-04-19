import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';

class AiTrainer extends StatefulWidget {
  const AiTrainer({super.key});

  @override
  State<AiTrainer> createState() => _AiTrainerState();
}

class _AiTrainerState extends State<AiTrainer> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _messages.add({
          'text': 'Hi, how are you? How can I help you?',
          'isUser': false,
        });
      });
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'text': text, 'isUser': true});
    });

    _controller.clear();

    // Add typing animation
    setState(() {
      _messages.add({'text': 'Typing...', 'isUser': false, 'isTyping': true});
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.removeWhere((msg) => msg['isTyping'] == true);
        _messages.add({
          'text': "Here's a smart AI reply to \"$text\" 😎",
          'isUser': false,
        });
      });
    });
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    bool isUser = message['isUser'] ?? false;
    bool isTyping = message['isTyping'] ?? false;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color:
              isUser
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        child: Text(
          isTyping ? 'Typing...' : message['text'],
          style: TextStyle(
            color:
                isUser
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.w500,
            fontStyle: isTyping ? FontStyle.italic : FontStyle.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Trainer Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessage(_messages[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.paddingS),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
