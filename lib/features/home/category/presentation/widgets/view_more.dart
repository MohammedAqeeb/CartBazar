import 'package:flutter/material.dart';

class ViewMoreButton extends StatelessWidget {
  final String firstText;
  final Function()? onTap;
  const ViewMoreButton({
    super.key,
    required this.firstText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'See All',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
