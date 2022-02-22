import 'package:assignment/core/extensions/buildcontext_extension.dart';
import 'package:assignment/product/constants/style/app_style.dart';
import 'package:assignment/product/models/album.dart';
import 'package:assignment/product/view/home/detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AlbumItem extends StatelessWidget {
  const AlbumItem(this.album, {Key? key}) : super(key: key);
  final Album album;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DetailPage(albumID: album.id!))),
      child: SizedBox(
        width: context.screenWidth,
        height: context.dynamicHeight(0.1),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                album.userId.toString(),
                style: TextStyle(color: AppStyle.textColor),
              ),
              backgroundColor: Color.fromARGB(255, Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255)),
            ),
            const SizedBox(width: 10),
            Flexible(
                child: Text(album.title!,
                    style: context.appTextTheme.bodyText1!
                        .copyWith(color: AppStyle.textColor)))
          ],
        ),
      ),
    );
  }
}
