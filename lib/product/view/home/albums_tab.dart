import 'package:assignment/core/widgets/loading_widget.dart';
import 'package:assignment/product/view/home/view_model/album_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/album_item.dart';

class AlbumTab extends StatefulWidget {
  const AlbumTab({Key? key}) : super(key: key);

  @override
  State<AlbumTab> createState() => _AlbumTabState();
}

class _AlbumTabState extends State<AlbumTab> {
  final ScrollController _controller = ScrollController();
  final AlbumCubit albumCubit = AlbumCubit();

  int index = 20;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        final start = index;
        index += 20;
        albumCubit.loadMore(start, index);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => albumCubit,
      child: BlocBuilder<AlbumCubit, AlbumState>(builder: (context, state) {
        switch (state.status) {
          case Status.initial:
          case Status.loading:
            return kLoadingWidget;
          case Status.error:
            return const Center(
                child: Text(
              'An error occurred while retrieving data.',
              style: TextStyle(color: Colors.red),
            ));
          case Status.loaded:
            return ListView.builder(
                controller: _controller,
                itemCount: state.albums!.length,
                itemBuilder: (context, index) {
                  return AlbumItem(state.albums![index]);
                });
        }
      }),
    );
  }
}
