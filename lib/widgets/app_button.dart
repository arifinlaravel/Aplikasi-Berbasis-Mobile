import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool filled;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: filled
          ? ElevatedButton(onPressed: onPressed, child: Text(text))
          : OutlinedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
