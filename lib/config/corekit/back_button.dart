import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.pop();
      },
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: const Color(0xff563fff).withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
    );
  }
}
