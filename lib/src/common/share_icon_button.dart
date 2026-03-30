import 'package:flutter/material.dart';

class ShareIconButton extends StatelessWidget {
  const ShareIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xff563fff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(Icons.share, color: Colors.white),
    );
  }
}
