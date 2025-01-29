import 'package:flutter/material.dart';
import 'package:kconnect/Widgets/chat_page.dart';

class ChatGoupsScreen extends StatelessWidget {
  ChatGoupsScreen({super.key});

  final List<ChatGroup> chatGroups = List.generate(
    20,
    (index) => ChatGroup(
      name: 'Group ${index + 1}',
      description: 'This is the description for Group ${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KConnect'),
      ),
      body: ListView.builder(
        itemCount: chatGroups.length,
        itemBuilder: (context, index) {
          final group = chatGroups[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(group.name[0]),
                ),
                title: Text(group.name),
                subtitle: Text(group.description),
                onTap: () {
                  // Navigate to chat group details or open chat
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatGroup {
  final String name;
  final String description;

  ChatGroup({required this.name, required this.description});
}
