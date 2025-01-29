import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  String _selectedCategory = 'General';

  final List<String> _categories = [
    'Holiday',
    'Exam Notice',
    'Emergency',
    'General'
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        text: _messageController.text,
        category: _selectedCategory,
        type: MessageType.text,
      ));
    });
    _messageController.clear();
  }

  void _sendMedia(MessageType type) {
    setState(() {
      _messages.add(ChatMessage(
        text: type.toString().split('.').last, // Placeholder for media
        category: _selectedCategory,
        type: type,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Chat'),
        actions: [
          DropdownButton<String>(
            value: _selectedCategory,
            dropdownColor: Colors.white,
            items: _categories
                .map((category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message.text),
                  subtitle: Text(
                      '${message.category} | ${message.type.toString().split('.').last}'),
                  leading: Icon(
                    message.type == MessageType.text
                        ? Icons.message
                        : Icons.attachment,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
                PopupMenuButton<MessageType>(
                  onSelected: _sendMedia,
                  icon: Icon(Icons.attach_file),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: MessageType.audio,
                      child: Text('Send Audio'),
                    ),
                    PopupMenuItem(
                      value: MessageType.video,
                      child: Text('Send Video'),
                    ),
                    PopupMenuItem(
                      value: MessageType.document,
                      child: Text('Send Document'),
                    ),
                    PopupMenuItem(
                      value: MessageType.contact,
                      child: Text('Send Contact'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final String category;
  final MessageType type;

  ChatMessage({
    required this.text,
    required this.category,
    required this.type,
  });
}

enum MessageType {
  text,
  audio,
  video,
  document,
  contact,
}