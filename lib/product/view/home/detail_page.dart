import 'package:assignment/core/extensions/buildcontext_extension.dart';
import 'package:assignment/core/widgets/loading_widget.dart';
import 'package:assignment/product/models/comment.dart';
import 'package:assignment/product/services/data_service.dart';
import 'package:flutter/material.dart';

import 'components/comment_item.dart';
import 'components/image_page_view.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.albumID}) : super(key: key);
  final int albumID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: context.screenPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.4),
                  child: ImagePageView(albumID: albumID),
                ),
                SizedBox(height: context.dynamicHeight(0.05)),
                FutureBuilder<List<Comment>?>(
                    future: DataService().fetchComments(albumID),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if ((snapshot.data == null) ||
                            (snapshot.data != null && snapshot.data!.isEmpty)) {
                          return Container();
                        }

                        return Column(
                          children: List.generate(
                            snapshot.data!.length,
                            (index) {
                              Comment comment = snapshot.data![index];
                              return CommentItem(comment: comment);
                            },
                          ),
                        );
                      }
                      return kLoadingWidget;
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
