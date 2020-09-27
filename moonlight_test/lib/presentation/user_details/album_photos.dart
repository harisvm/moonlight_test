import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';
import 'package:moonlight_test/presentation/widgets/circular_progress.dart';
import 'package:moonlight_test/presentation/widgets/get_appbar.dart';


///photos are showed in list
///
class AlbumPhotos extends StatefulWidget {
  static String route = 'albumPhotos';

  @override
  _AlbumPhotosState createState() => _AlbumPhotosState();
}

class _AlbumPhotosState extends State<AlbumPhotos> {
  UserFeedBloc _userFeedBloc = UserFeedBloc();

  @override
  void initState() {
    _userFeedBloc.add(LoadPhotosByAlbums());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = AppTheme.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(context, title: 'Photos'),
        body: BlocBuilder(
            bloc: _userFeedBloc,
            builder: (context, state) {
              if (state is PhotosByAlbumLoaded || state is InitialUserFeedState) {
                return ListView.builder(
                  itemCount: GlobalData.photosByAlbum?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          side: BorderSide(width: 1, color: Colors.green)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                GlobalData.photosByAlbum[index].title,
                                style: _theme.textTheme.headline6
                                    .copyWith(color: AppColors.purple),
                              ),
                            ),
                            FadeInImage.assetNetwork(
                                placeholder: cupertinoActivityIndicator,
                                image: GlobalData.photosByAlbum[index].url)
                          ]),
                    );
                  },
                );
              }
              else if(state is LoadData) {
                return Center(child: showCircleProgress());
              }

              return Container(child: Center(child: Text('Something went wrong'),),);
            }));
  }
}
