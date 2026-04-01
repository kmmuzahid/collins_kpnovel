import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/data/model/comment_model.dart';

class CommentSection extends StatelessWidget {
  final ScrollController scrollController;
  final List<Comment> comments = [
    Comment(
      author: "Sarah Chen",
      content:
          "OMG! That plot twist at the end! I didn't see it coming at all! The author is absolutely brilliant! 😱✨",
      timeAgo: "2 hours ago",
      likes: 234,
    ),
    Comment(
      author: "Mike Johnson",
      content: "I know right! The foreshadowing was there all along!",
      timeAgo: "2 hours ago",
      likes: 234,
      isReply: true,
    ),
    Comment(
      author: "Sarah Chen",
      content:
          "OMG! That plot twist at the end! I didn't see it coming at all! The author is absolutely brilliant! 😱✨",
      timeAgo: "2 hours ago",
      likes: 234,
    ),
  ];

  CommentSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.comment_outlined, color: context.color.subtext),
              CommonText(text: AppString.Comments, fontSize: 16, fontWeight: FontWeight.bold),
            ],
          ),
          CommonText(
            text: "3 ${AppString.discussions}",
            left: 20,
            fontSize: 12,
            textColor: context.color.navbarIconsUnselected,
          ).start,
          10.height,
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: comments.length,
              itemBuilder: (context, index) => CommentCard(comment: comments[index]),
            ),
          ),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Share your thoughts about this chapter...",
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent.shade100,
                  child: const Icon(Icons.send, size: 18, color: Colors.white),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.deepPurpleAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.deepPurpleAccent.withOpacity(0.5)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    AppString.comments_require_admin_approval,
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
              const Text("0/500", style: TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
          10.height,
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final Comment comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: comment.isReply ? 48.0 : 0.0, bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: comment.isReply ? const Color(0xFFF0F7FF) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade100),
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
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.author,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        comment.timeAgo,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '${comment.timeAgo.split(' ')[0]}h',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(comment.content, style: const TextStyle(color: Colors.black87, height: 1.4)),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        "${comment.likes}",
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Reply", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
