import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, required this.maxline});
  final String hint;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: maxline,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ));
  }
}
