import 'package:flutter/material.dart';
import 'package:my_notes/core/constantes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: const Center(
            child: Text(
          "Add note",
          style: TextStyle(color: Colors.black, fontSize: 16),
        )),
      ),
    );
  }
}
