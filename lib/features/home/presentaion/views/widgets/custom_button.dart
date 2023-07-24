import 'package:flutter/material.dart';
import 'package:my_notes/core/constantes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoadin = false});
  final void Function()? onTap;
  final bool isLoadin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor2, borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Center(
            child: isLoadin
                ? const CircularProgressIndicator()
                : const Text(
                    "Add note",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
      ),
    );
  }
}
