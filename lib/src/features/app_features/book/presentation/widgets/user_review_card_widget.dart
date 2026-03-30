import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/constants.dart';

class UserReviewCardWidget extends StatelessWidget {
  const UserReviewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade100, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonImage(src: Constants.sampleImage, size: 45, borderRadius: 23),
              10.width,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Sarah Chen',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    4.height,
                    // Star Rating Row
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: Colors.grey.shade500),
                  4.width,
                  CommonText(text: '2 weeks ago', fontSize: 13, textColor: Colors.grey.shade500),
                ],
              ),
            ],
          ),
          10.height,

          const CommonText(
            text:
                'This is now in my top 5 favorite novels of all time! The emotional depth and world-building are incredible. Every chapter left me wanting more. A must-read!',
            fontSize: 16,
            height: 1.5,
            isDescription: true,
            textAlign: .left,
            textColor: Color(0xff364153),
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
