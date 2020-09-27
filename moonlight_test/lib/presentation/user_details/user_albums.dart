import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';
import 'package:moonlight_test/presentation/user_details/album_photos.dart';
import 'package:moonlight_test/presentation/widgets/circular_progress.dart';
import 'package:moonlight_test/presentation/widgets/get_appbar.dart';
import 'package:moonlight_test/presentation/widgets/pushNamed.dart';


///albums showed in tiles
class UserAlbums extends StatefulWidget {
  static const route = 'userAlbums';

  @override
  _UserAlbumsState createState() => _UserAlbumsState();
}

class _UserAlbumsState extends State<UserAlbums> {
  UserFeedBloc _userFeedBloc = UserFeedBloc();

  @override
  void initState() {
    _userFeedBloc.add(LoadAlbumList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = AppTheme.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(context, title: 'User Albums'),
        body: BlocBuilder(
            bloc: _userFeedBloc,
            builder: (context, state) {
              if (state is AlbumListLoaded || state is InitialUserFeedState) {
                return GridView.builder(
                  itemCount: GlobalData.albumsByUser?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          print("---$index");
                          print(GlobalData.albumsByUser[index].id);
                          GlobalData.albumId =
                              GlobalData.albumsByUser[index].id;
                          pushNamed(
                              context: context, routeName: AlbumPhotos.route);
                        },
                        child: GridTile(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                icon: Icon(
                              Icons.insert_photo,
                            )),
                          ),
                          header: Text(
                            GlobalData.albumsByUser[index].title,
                            style: _theme.textTheme.caption
                                .copyWith(color: AppColors.black),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is LoadData) {
                return Center(child: showCircleProgress());
              }
              return Container(
                child: Center(
                  child: Text('Something went wrong'),
                ),
              );
            }));
  }
}
