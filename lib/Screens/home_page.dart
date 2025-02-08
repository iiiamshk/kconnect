import 'package:flutter/material.dart';
import 'package:kconnect/Widgets/kapp_bar.dart';
import 'package:kconnect/Widgets/notice_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(44, 14, 12, 1),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                "K-Connect",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 165,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_add_outlined,
                  color: Colors.white.withValues(alpha: 0.9),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            KappBar(),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Welcome User",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                NoticeCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
