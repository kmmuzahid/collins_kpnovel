import 'package:core_kit/text/common_text.dart';
import 'package:core_kit/utils/core_screen_utils.dart';
import 'package:core_kit/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';

class BookReadingWidget extends StatelessWidget {
  const BookReadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        CommonText(
          text: 'The Beginning',
          fontSize: 24,
          fontWeight: .w700,
          textColor: context.color.bodyText,
        ),
        8.height,
        CommonText(text: '500 ${AppString.words}', textColor: context.color.iconClr, fontSize: 14),
        Expanded(child: contentWidget(context)),
        CommonText(text: '1 of 10', textColor: context.color.iconClr, fontSize: 14).end,
      ],
    );
  }

  Widget contentWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: .topStart,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: context.color.subtleOverlaysShadows, width: 1.2.w),
        ),
        child: const CommonText(
          isDescription: true,
          textAlign: .start,
          left: 10,
          right: 10,
          top: 10,
          bottom: 10,
          text: sampleHtmlText,
        ),
      ),
    );
  }
}

const sampleHtmlText = '''<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Book Page</title>

  <style>
    body {
      margin: 0;
      background: #f4f1ea;
      font-family: "Georgia", serif;
      color: #2c2c2c;
    }

    .page {
      margin: 0 auto;
      padding: 0 50px;
      background: #fffdf8;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      border-radius: 8px;
      line-height: 1.8;
      font-size: 18px;
    }

    .chapter {
      text-align: center;
      font-size: 14px;
      letter-spacing: 2px;
      margin-bottom: 30px;
      color: #888;
    }

    .title {
      text-align: center;
      font-size: 28px;
      margin-bottom: 0;
    }

    p {
      text-indent: 0;
      margin: 0 0 20px 0;
    }

    p:first-of-type {
      text-indent: 0;
      font-size: 20px;
      line-height: 1.6;
    }

    .dialogue {
      text-indent: 0;
      margin-left: 0;
      font-style: italic;
    }
  </style>
</head>

<body>
  <div class="page">
    <p>
      The night was darker than usual. Violet stepped out of her apartment, unaware that her life was about to change forever.
    </p>
    <p>
      The city lights flickered in the distance, casting long shadows across the empty streets. She pulled her coat tighter around her shoulders, feeling a chill that had nothing to do with the weather.
    </p>

    <p class="dialogue">
      "You're late," a voice said from the shadows.
    </p>

    <p>
      Violet froze. She knew that voice. It had haunted her dreams for years.
    </p>

    <p class="dialogue">
      "I didn't think you'd come," she replied, her voice steadier than she felt.
    </p>

    <p>
      A figure emerged from the darkness. Tall, imposing, with eyes that seemed to glow in the dim light. This was the man who had changed everything. The man who had awakened powers within her that she never knew existed.
    </p>

    <p class="dialogue">
      "We need to talk," he said simply. "About what you are. About what you're meant to become."
    </p>

    <p>
      Violet's hands trembled. She had spent her entire life running from the truth. But tonight, there would be no more running.
    </p>

    <p class="dialogue">
      "I'm listening," she said.
    </p>

    <p>
      And with those two words, her destiny began to unfold.
    </p>

  </div>
</body>
</html>''';
