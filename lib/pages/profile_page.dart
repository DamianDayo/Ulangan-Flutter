import 'package:flutter/material.dart';
import 'package:ulangan_flutter/components/title_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final creators = [
      ["Diogenes", "assets/Damian.jpg"],
      ["Jordan Thomas", "assets/Jordan.jpg"],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const TitleText(
          text: "Profile",
          fontSize: 30,
          color: Color.fromARGB(255, 255, 230, 0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: creators
              .map((creator) => Column(
                    children: [
                      CircleAvatar(
                        radius: 81,
                        backgroundImage: AssetImage(creator[1]),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        " ${creator[0]}", 
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
