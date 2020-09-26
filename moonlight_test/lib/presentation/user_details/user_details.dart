import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';

import '../../config/theme.dart';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
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
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'User Details',
          ),
          backgroundColor: AppColors.transparent,
        ),
        body: BlocBuilder(
            bloc: _userFeedBloc,
            builder: (context, state) {
              if (state is UserFeedLoaded || state is InitialUserFeedState)
                return Container(
                  child: ListView.separated(
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '',
                                  style: _theme.textTheme.caption.copyWith(
                                      color: AppColors.black, fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '',
                                  style: _theme.textTheme.caption.copyWith(
                                      color: AppColors.black, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, position) {
                      return Divider();
                    },
                  ),
                );
              else
                return CircularProgressIndicator();
            }));
  }
}
