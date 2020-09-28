import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/data/models/user_detail_model.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';
import 'package:moonlight_test/presentation/user_details/user_albums.dart';
import 'package:moonlight_test/presentation/user_details/user_posts.dart';
import 'package:moonlight_test/presentation/user_details/user_todos.dart';
import 'package:moonlight_test/presentation/widgets/circular_progress.dart';
import 'package:moonlight_test/presentation/widgets/custom_button.dart';
import 'package:moonlight_test/presentation/widgets/get_appbar.dart';
import 'package:moonlight_test/presentation/widgets/pushNamed.dart';

import '../../config/theme.dart';

///home page - user list is being shown here
class UserDetailList extends StatefulWidget {
  static String route = 'userList';

  @override
  _UserDetailListState createState() => _UserDetailListState();
}

class _UserDetailListState extends State<UserDetailList> {
  UserFeedBloc _userFeedBloc;
  IconData iconData = Icons.expand_more;
  int clickedIndex ;

  @override
  void initState() {
    _userFeedBloc = UserFeedBloc();
    _userFeedBloc.add(LoadUsersList());
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
              if (state is UsersListLoaded || state is InitialUserFeedState) {
                return ListView.separated(
                  itemCount: GlobalData.userDetailList?.length ?? 0,
                  itemBuilder: (context, index) {
                    Address address = GlobalData.userDetailList[index].address;
                    return ExpansionTile(
                      childrenPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      backgroundColor: AppColors.white,
                      title: Card(
                        elevation: 2.0,
                        color: AppColors.white,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset('assets/user.png')),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      GlobalData.userDetailList[index].name,
                                      style:
                                          _theme.textTheme.headline5.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Image.asset('assets/email.png')),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      GlobalData.userDetailList[index].email,
                                      style:
                                          _theme.textTheme.headline6.copyWith(
                                        color: AppColors.darkGray,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 40.0, top: 8, bottom: 5),
                                child: Text(
                                  address.city + " \n" + address.street,
                                  style: _theme.textTheme.bodyText2.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      trailing: Icon(iconData),
                        initiallyExpanded: index == clickedIndex,
                      onExpansionChanged: (isExpanded) {
                        clickedIndex = index;

                        setState(() {
                          iconData = isExpanded
                              ? Icons.expand_less
                              : Icons.expand_more;
                        });
                      },
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      'assets/post.png',
                                    ),
                                  ),
                                  gradient: LinearGradient(colors: <Color>[
                                    AppColors.cyan,
                                    AppColors.cyan
                                  ]),
                                  shape: ButtonType.BUTTON_ROUND,
                                  onPressed: () {
                                    GlobalData.userId =
                                        GlobalData.userDetailList[index].id;
                                    pushNamed(
                                        context: context,
                                        routeName: UserPosts.route);
                                  },
                                  width: 60,
                                  height: 70,
                                ),
                                Text(
                                  'Posts',
                                  style: _theme.textTheme.button
                                      .copyWith(color: AppColors.black),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      'assets/albums.png',
                                    ),
                                  ),
                                  gradient: LinearGradient(colors: <Color>[
                                    AppColors.cyan,
                                    AppColors.cyan
                                  ]),
                                  shape: ButtonType.BUTTON_ROUND,
                                  onPressed: () {
                                    GlobalData.userId =
                                        GlobalData.userDetailList[index].id;
                                    pushNamed(
                                        context: context,
                                        routeName: UserAlbums.route);
                                  },
                                  width: 60,
                                  height: 70,
                                ),
                                Text(
                                  'Albums',
                                  style: _theme.textTheme.button
                                      .copyWith(color: AppColors.black),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      'assets/todo.png',
                                    ),
                                  ),
                                  gradient: LinearGradient(colors: <Color>[
                                    AppColors.cyan,
                                    AppColors.cyan
                                  ]),
                                  shape: ButtonType.BUTTON_ROUND,
                                  onPressed: () {
                                    GlobalData.userId =
                                        GlobalData.userDetailList[index].id;
                                    pushNamed(
                                        context: context,
                                        routeName: UserToDos.route);
                                  },
                                  width: 60,
                                  height: 70,
                                ),
                                Text(
                                  'To do',
                                  style: _theme.textTheme.button
                                      .copyWith(color: AppColors.black),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, position) {
                    return Divider();
                  },
                );
              } else if (state is LoadData) {
                return Center(child: showCircleProgress());
              } else
                return Container(
                  child: Center(
                    child: Text('Something went wrong'),
                  ),
                );
            }));
  }
}
