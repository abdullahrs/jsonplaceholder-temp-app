import 'package:assignment/product/constants/strings/asset_paths.dart';
import 'package:assignment/product/constants/style/app_style.dart';
import 'package:assignment/product/models/user.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: Column(
            children: [
              Flexible(flex: 6, child: Image.asset(user.imageUrl)),
              Flexible(
                  flex: 2,
                  child: Text(user.name,
                      style: TextStyle(color: AppStyle.textColor))),
              Flexible(
                  flex: 2,
                  child: Text(user.country,
                      style: TextStyle(color: AppStyle.textColor))),
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _infoItem(Icons.phone, 'MOBILE', user.phoneNumber),
                _infoItem(Icons.mail, 'EMAIL', user.mail),
              ],
            ),
          ),
        ),
        Flexible(
            flex: 3,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _verticalStat(Icons.photo_album_outlined,
                            user.numberOfAlbums.toString()),
                        _verticalStat(
                            Icons.star, user.numberOfEvaluations.toString()),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                            child: _logoButton(
                                AssetPaths.githubLogo, user.githubUrl)),
                        Flexible(
                            child: _logoButton(
                                AssetPaths.inLogo, user.linkedinUrl)),
                        Flexible(
                            child: _logoButton(
                                AssetPaths.instaLogo, user.instagramUrl)),
                      ]),
                ],
              ),
            ))
      ],
    );
  }

  InkWell _logoButton(String path, String url) => InkWell(
        onTap: () async {
          await launch(url, enableJavaScript: true);
        },
        child: Image.asset(
          path,
          width: 40,
          height: 40,
        ),
      );

  Column _verticalStat(IconData iconData, String stat) {
    return Column(
      children: [
        Icon(iconData, size: 32, color: AppStyle.buttonColor),
        Text(stat),
      ],
    );
  }

  Padding _infoItem(IconData iconData, String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(iconData, size: 32, color: AppStyle.buttonColor),
          const SizedBox(width: 10),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(text: title),
              const TextSpan(text: '\n'),
              TextSpan(text: content),
            ],
          ))
        ],
      ),
    );
  }
}
