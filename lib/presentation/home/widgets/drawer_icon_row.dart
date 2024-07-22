import 'package:flutter/material.dart';

class DrawerIconRow extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onPressed;

  const DrawerIconRow({required this.icon, required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MaterialButton(
        height: 48,
        onPressed: onPressed,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
