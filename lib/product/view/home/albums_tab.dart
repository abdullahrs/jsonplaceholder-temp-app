import 'package:assignment/core/widgets/loading_widget.dart';
import 'package:assignment/product/view/home/view_model/album_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/album_item.dart';

class AlbumTab extends StatelessWidget {
  const AlbumTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumCubit()..getAlbums(),
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
                itemCount: state.albums!.length,
                itemBuilder: (context, index) {
                  return AlbumItem(state.albums![index]);
                });
        }
      }),
    );
  }
}
