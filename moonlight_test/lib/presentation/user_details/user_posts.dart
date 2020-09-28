import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';
import 'package:moonlight_test/presentation/widgets/circular_progress.dart';
import 'package:moonlight_test/presentation/widgets/get_appbar.dart';

///user posts are shown in this page
class UserPosts extends StatefulWidget {
  static String route = 'userPost';

  @override
  _UserPostsState createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  UserFeedBloc _userFeedBloc;
  bool isCommentClicked = false;
  int clickedIndex;
  ScrollController _scrollController;

  @override
  void initState() {
    _userFeedBloc = UserFeedBloc();

    _userFeedBloc.add(LoadPostsByUsers());
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _theme = AppTheme.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(context, title: 'Posts'),
        body: BlocBuilder(
            bloc: _userFeedBloc,
            builder: (context, state) {
              if (state is UserPostsLoaded ||
                  state is InitialUserFeedState ||
                  state is CommentsOnPostLoaded) {
                if (state is CommentsOnPostLoaded) {
                  isCommentClicked = true;
                }
                print('state $state');
                return ListView.separated(
                  addAutomaticKeepAlives: true,
                  itemCount: GlobalData.postListByUser?.length ?? 0,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      onExpansionChanged: (isExpanded) {
                        clickedIndex = index;

                        if (isExpanded) {
                          GlobalData.postId =
                              GlobalData.postListByUser[index].id;
                          _userFeedBloc.add(LoadCommentsOnPosts());
                        }
                      },
                      initiallyExpanded:
                          isCommentClicked && index == clickedIndex,
                      title: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            side: BorderSide(width: 1, color: Colors.grey)),
                        color: AppColors.white,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.perm_identity),
                                  ),
                                  Text('User Id ' +
                                      GlobalData.postListByUser[index].id
                                          .toString(),style: _theme.textTheme.caption.copyWith(color: AppColors.black,fontWeight: FontWeight.bold),),
                                  Spacer(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  GlobalData.postListByUser[index].title,
                                  style: _theme.textTheme.bodyText1.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  GlobalData.postListByUser[index].body,
                                  style: _theme.textTheme.bodyText2.copyWith(
                                    color: AppColors.purple,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.comment),
                              ),
                              Center(child: Text('Comments')),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      children: [
                        BlocBuilder(
                            bloc: _userFeedBloc,
                            builder: (context, state) {
                              if (state is CommentsOnPostLoaded) {
                                return ListView.separated(
                                  itemCount:
                                      GlobalData.commentsOnPost.length > 3
                                          ? 3
                                          : GlobalData.commentsOnPost.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: AppColors.lightGray,
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                GlobalData
                                                        ?.commentsOnPost[index]
                                                        ?.email ??
                                                    '',
                                                style: _theme.textTheme.caption
                                                    .copyWith(
                                                        color:
                                                            AppColors.purple),
                                              ),
                                              Text(
                                                GlobalData.commentsOnPost[index]
                                                        ?.body ??
                                                    '',
                                                style: _theme.textTheme.caption
                                                    .copyWith(
                                                        color: AppColors.black),
                                              ),
                                            ]),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, position) {
                                    return Divider();
                                  },
                                );
                              }

                              return Center(child: showCircleProgress());
                            }),
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
