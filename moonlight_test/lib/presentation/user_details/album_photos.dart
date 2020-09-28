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
                return GridView.builder(
                  itemCount: GlobalData.photosByAlbum?.length ?? 0,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: .7
                  ),
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return Card(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                         ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,

                          children: [

                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                  placeholder: cupertinoActivityIndicator,
                                  image: GlobalData.photosByAlbum[index].url),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left:3.0,top: 3,right: 3),
                              child: Text(
                                GlobalData.photosByAlbum[index].title,
                                overflow: TextOverflow.ellipsis,
maxLines: 3,
                                style: _theme.textTheme.bodyText1
                                    .copyWith(color: AppColors.black,fontWeight: FontWeight.bold),
                              ),
                            ),
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
