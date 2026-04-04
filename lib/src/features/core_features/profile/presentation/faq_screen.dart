import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: const CommonAppBar(title: 'FAQ\'s'),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildFAQItem(
            "How do I change my password?",
            "Navigate to the Account section on the Settings screen and tap 'Change Password'. You will be prompted to enter your current password and then set a new one.",
          ),
          _buildFAQItem(
            "Can I disable all notifications?",
            "Yes! In the Preferences section, you can toggle the 'Notifications' switch to turn off all push alerts instantly.",
          ),
          _buildFAQItem(
            "Is my data secure?",
            "Absolutely. Rinik Tech uses industry-standard encryption to ensure your personal information and account data remain private and secure.",
          ),
          _buildFAQItem(
            "How do I delete my account?",
            "If you wish to leave us, scroll to the bottom of the Settings screen and tap 'Delete Account'. Please note this action is permanent and cannot be undone.",
          ),
          _buildFAQItem(
            "How often is the app updated?",
            "We typically release updates once a month to introduce new features, improve performance, and fix any known bugs.",
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        // This removes the default border/divider that ExpansionTile adds
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Colors.purple,
          collapsedIconColor: Colors.grey,
          title: Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF4A4E69),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.5, // Improves readability
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
