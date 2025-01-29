import 'package:flutter/material.dart';
import 'package:kconnect/Screens/contact_page.dart';
import 'package:kconnect/Screens/document_page.dart';
import 'package:kconnect/Screens/chat_goups_screen.dart';
import 'package:kconnect/Widgets/kapp_bar.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatGoupsScreen(),
                            ),
                          ); //
                        },
                        child: Card(
                          color: Colors.red,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Center(
                              child: Text(
                                "Groups",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactPage(),
                            ),
                          ); //
                        },
                        child: Card(
                          color: Colors.red,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Center(
                              child: Text(
                                "Contacts",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DocumentPage(),
                            ),
                          ); //
                        },
                        child: Card(
                          color: Colors.red,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Center(
                              child: Text(
                                "Documents",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KappBar(),
                            ),
                          ); //
                        },
                        child: Card(
                          color: Colors.red,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Center(
                              child: Text(
                                "Groups",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Card(
                        color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Center(
                            child: Text(
                              "Groups",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Card(
                        color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Center(
                            child: Text(
                              "Groups",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
