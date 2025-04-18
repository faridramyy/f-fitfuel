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
    // Simulate initial message from AI
    Future.delayed(Duration(milliseconds: 500), () {
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
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    return Align(
      alignment:
          message['isUser'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message['isUser'] ? Colors.blueAccent : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message['text'],
          style: TextStyle(
            color: message['isUser'] ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Trainer Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessage(_messages[index]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
