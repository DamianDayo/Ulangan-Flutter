import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}
// katanya size, color itu jadiin variable, biar bisa misal di page login size nya 24 warna biru, di histori bisa size 20 warna merah