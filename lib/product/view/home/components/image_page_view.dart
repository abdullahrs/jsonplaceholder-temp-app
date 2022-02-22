import 'package:assignment/core/extensions/buildcontext_extension.dart';
import 'package:assignment/core/widgets/loading_widget.dart';
import 'package:assignment/product/constants/style/app_style.dart';
import 'package:assignment/product/models/photo.dart';
import 'package:assignment/product/services/data_service.dart';
import 'package:flutter/material.dart';

class ImagePageView extends StatelessWidget {
  const ImagePageView({
    Key? key,
    required this.albumID,
  }) : super(key: key);

  final int albumID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>?>(
        future: DataService().fetchPhotos(albumID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if ((snapshot.data == null) ||
                (snapshot.data != null && snapshot.data!.isEmpty)) {
              return Container();
            }
            return _PageViewWithIndicator(snapshot.data!);
          }
          return kLoadingWidget;
        });
  }
}

class _PageViewWithIndicator extends StatefulWidget {
  const _PageViewWithIndicator(this.photos, {Key? key}) : super(key: key);
  final List<Photo> photos;
  @override
  State<_PageViewWithIndicator> createState() => _PageViewWithIndicatorState();
}

class _PageViewWithIndicatorState extends State<_PageViewWithIndicator> {
  int currentPage = 0;
  late List<Photo> photos;

  @override
  void initState() {
    super.initState();
    photos = widget.photos;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 8,
          child: PageView.builder(
              onPageChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    currentPage = value;
                  });
                }
              },
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return Image.network(photos.elementAt(index).url!);
              }),
        ),
        const Spacer(),
        Flexible(
            flex: 1,
            child: Text(
              "${currentPage + 1}/${photos.length}",
              style: context.appTextTheme.caption!
                  .copyWith(color: AppStyle.subTextColor),
            ))
      ],
    );
  }
}
