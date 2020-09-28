import 'package:flutter/cupertino.dart';
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
  bool isExpanded = false;
  int clickedIndex ;

  @override
  void initState() {


    _userFeedBloc = UserFeedBloc();
    _userFeedBloc.add(LoadUsersList());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      backgroundColor: AppColors.white,
                      title: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10), ),
                            side: BorderSide(width: 1, color: Colors.transparent)),
                        color: AppColors.backgroundLight2,


                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Image.asset('assets/user.png')),
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0,),
                                    child: Text(
                                      GlobalData.userDetailList[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          _theme.textTheme.headline5.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset('assets/email.png')),
                                  Expanded(
                                    flex: 6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text(
                                        GlobalData.userDetailList[index].email,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            _theme.textTheme.headline6.copyWith(
                                          color: AppColors.darkGray,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 45.0, top: 8, bottom: 10),
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
                      onExpansionChanged: (isExpanded) {
                        if (isExpanded) {
                          setState(() {
                              clickedIndex=index;
                          });
                        }

                        else{
                          setState(() {
                            clickedIndex =-1;
                          });

                        }
                      },
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: ClipOval(
                          child: Material(
                            color: Colors.black, // button color
                            child: InkWell(
                              splashColor: Colors.white, // inkwell color
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    index == clickedIndex
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    color: AppColors.white,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      maintainState: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Row(
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
