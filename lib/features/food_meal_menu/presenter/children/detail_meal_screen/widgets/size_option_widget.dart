import 'package:flutter/material.dart';

class SizeOptionWidget extends StatelessWidget {
  const SizeOptionWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
              width: 1,
            ),
          ),
          child: Icon(
            Icons.coffee,
            color: isSelected ? Colors.black : Colors.grey,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
