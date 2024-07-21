import 'package:flutter/material.dart';

class ActiveButton extends StatelessWidget {
  final bool isActive;
  final String text;
  final VoidCallback onPressed;

  const ActiveButton({required this.text, this.isActive = false, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(100)),
      child: TextButton(
        onPressed: () => isActive ? onPressed() : null,
        child: isActive
            ? Text(
                text,
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 14, fontWeight: FontWeight.w500, height: 1.42),
              )
            : Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary)),
      ),
    );
  }
}
