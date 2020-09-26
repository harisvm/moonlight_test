import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';
import 'package:moonlight_test/presentation/user_details/user_albums.dart';
import 'package:moonlight_test/presentation/user_details/user_posts.dart';
import 'package:moonlight_test/presentation/user_details/user_todos.dart';
import 'package:moonlight_test/presentation/widgets/custom_button.dart';
import 'package:moonlight_test/presentation/widgets/get_appbar.dart';
import 'package:moonlight_test/presentation/widgets/pushNamed.dart';

import '../../config/theme.dart';

class UserDetailList extends StatefulWidget {
  static String route = 'userList';

  @override
  _UserDetailListState createState() => _UserDetailListState();
}

class _UserDetailListState extends State<UserDetailList> {
  UserFeedBloc _userFeedBloc;

  @override
  void initState() {
    _userFeedBloc = UserFeedBloc();
    _userFeedBloc.add(LoadUserFeed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = AppTheme.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(context, title: 'User Details'),
        body: BlocBuilder(
            bloc: _userFeedBloc,
            builder: (context, state) {
              if (state is UserFeedLoaded || state is InitialUserFeedState)
                return ListView.separated(
                  itemCount: GlobalData.userDetailModel?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      childrenPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      backgroundColor: AppColors.lightGray,
                      title: Card(
                        elevation: 2.0,
                        color: AppColors.white,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  GlobalData.userDetailModel[index].name,
                                  style: _theme.textTheme.bodyText1.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  GlobalData.userDetailModel[index].email,
                                  style: _theme.textTheme.bodyText2.copyWith(
                                    color: AppColors.purple,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  GlobalData
                                      .userDetailModel[index].address.city,
                                  style: _theme.textTheme.bodyText2.copyWith(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              child: Text(
                                'Posts',
                                style: _theme.textTheme.button
                                    .copyWith(color: AppColors.white),
                              ),
                              shape: ButtonType.BUTTON_ROUND,
                              onPressed: () {
                                pushNamed(
                                    context: context,
                                    routeName: UserPosts.route);
                              },
                              width: 60,
                              height: 70,
                            ),
                            CustomButton(
                                child: Text(
                                  'Albums',
                                  style: _theme.textTheme.button
                                      .copyWith(color: AppColors.white),
                                ),
                                shape: ButtonType.BUTTON_ROUND,
                                onPressed: () {
                                  pushNamed(
                                      context: context,
                                      routeName: UserAlbums.route);
                                },
                                width: 60,
                                height: 70,
                                gradient: LinearGradient(colors: <Color>[
                                  AppColors.success,
                                  AppColors.success
                                ])),
                            CustomButton(
                                child: Text(
                                  'To Do',
                                  style: _theme.textTheme.button
                                      .copyWith(color: AppColors.white),
                                ),
                                shape: ButtonType.BUTTON_ROUND,
                                onPressed: () {
                                  pushNamed(
                                      context: context,
                                      routeName: UserTodos.route);
                                },
                                width: 60,
                                height: 70,
                                gradient: LinearGradient(colors: <Color>[
                                  AppColors.orange,
                                  AppColors.orange
                                ])),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, position) {
                    return Divider();
                  },
                );
              else
                return CircularProgressIndicator();
            }));
  }
}
