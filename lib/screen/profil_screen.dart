// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EDE5),
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Color.fromARGB(255, 168, 126, 10),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              maxRadius: 70,
            ),
            Text(
              "Nama",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Nomor Anggota/ Nomor Admin",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_2),
                Text(
                  "Status",
                  style: TextStyle(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}