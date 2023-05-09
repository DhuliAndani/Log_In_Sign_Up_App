import 'package:flutter/material.dart';

class CommonSignIn extends StatelessWidget {
  final String? image;
  final String? text;

  const CommonSignIn({super.key, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return
     Container(
      height: 60,
      width: 375,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3D5),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image!),
          const SizedBox(width: 25),
          Text(
            text!,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
