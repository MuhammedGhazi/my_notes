import 'package:flutter/material.dart';
import 'package:my_notes/core/constantes.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.indexColors,
    required this.isChacked,
  });
  final bool isChacked;
  final int indexColors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: isChacked
          ? CircleAvatar(
              backgroundColor: Colors.white,
              radius: 48,
              child: CircleAvatar(
                  backgroundColor: Color(kListColors[indexColors]), radius: 44),
            )
          : CircleAvatar(
              backgroundColor: Color(kListColors[indexColors]),
              radius: 48,
            ),
    );
  }
}
