import 'package:assignment/core/extensions/buildcontext_extension.dart';
import 'package:assignment/product/models/comment.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name!,
              style: context.appTextTheme.headline5,
            ),
            Divider(thickness: 2, color: Colors.grey[700]),
            Text(comment.body!, style: context.appTextTheme.bodyText2),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(comment.email!),
            ),
          ],
        ),
      ),
    );
  }
}
