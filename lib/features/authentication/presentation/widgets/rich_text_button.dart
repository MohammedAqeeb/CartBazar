import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  final String richTextTitle;
  final String spanTextTitle;
  final Function() onTap;
  const RichTextButton({
    super.key,
    required this.richTextTitle,
    required this.spanTextTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: richTextTitle,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: spanTextTitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
