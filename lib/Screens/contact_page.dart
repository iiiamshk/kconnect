import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactPage extends StatelessWidget {
  final List<StaffContact> staffContacts = List.generate(
    15,
    (index) => StaffContact(
      name: 'Staff Member ${index + 1}',
      designation: 'Designation ${index + 1}',
      phoneNumber: '+911234567899${index + 10}',
      email: 'staff${index + 1}@university.edu',
    ),
  );

  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label copied to clipboard')),
    );
  }

  void _navigateToChat(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigate to chat with $name')),
    );
    // Add navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Staff Contacts'),
      ),
      body: ListView.builder(
        itemCount: staffContacts.length,
        itemBuilder: (context, index) {
          final contact = staffContacts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(contact.name[0]),
                ),
                title: Text(contact.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contact.designation),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 16),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            contact.phoneNumber,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, size: 16),
                          onPressed: () => _copyToClipboard(
                              context, contact.phoneNumber, 'Phone number'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.email, size: 16),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            contact.email,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, size: 16),
                          onPressed: () =>
                              _copyToClipboard(context, contact.email, 'Email'),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () => _navigateToChat(context, contact.name),
                  child: Text('Chat'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StaffContact {
  final String name;
  final String designation;
  final String phoneNumber;
  final String email;

  StaffContact({
    required this.name,
    required this.designation,
    required this.phoneNumber,
    required this.email,
  });
}
