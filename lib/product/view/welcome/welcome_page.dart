import 'package:assignment/core/extensions/buildcontext_extension.dart';
import 'package:assignment/product/constants/strings/asset_paths.dart';
import 'package:assignment/product/constants/strings/texts.dart';
import 'package:assignment/product/constants/style/app_style.dart';
import 'package:assignment/product/view/home/home.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.logoPath),
            const SizedBox(height: 20),
            Text(Texts.welcomeText,
                style: context.appTextTheme.headline5!
                    .copyWith(color: AppStyle.textColor)),
            const SizedBox(height: 20),
            Text(Texts.welcomeSubText,
                style: context.appTextTheme.subtitle1!
                    .copyWith(color: AppStyle.subTextColor)),
            const SizedBox(height: 40),
            Container(
              height: context.dynamicHeight(0.075),
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const Home())),
                child: Text(Texts.next,
                    style: context.appTextTheme.bodyText1!
                        .copyWith(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppStyle.subTextColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
