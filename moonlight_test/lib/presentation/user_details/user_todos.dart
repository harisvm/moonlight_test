import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';
import 'package:moonlight_test/presentation/widgets/circular_progress.dart';
import 'package:moonlight_test/presentation/widgets/custom_button.dart';
import 'package:moonlight_test/presentation/widgets/get_appbar.dart';

class UserTodos extends StatefulWidget {
  static String route = 'userTodos';

  @override
  _UserTodosState createState() => _UserTodosState();
}

class _UserTodosState extends State<UserTodos> {
  UserFeedBloc _userFeedBloc;

  @override
  void initState() {
    _userFeedBloc = UserFeedBloc();
    _userFeedBloc.add(LoadToDosList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = AppTheme.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(context, title: 'To Dos'),
        body: BlocBuilder(
            bloc: _userFeedBloc,
            builder: (context, state) {
              if (state is TodosByUserLoaded || state is InitialUserFeedState) {
                return ListView.separated(
                  itemCount: GlobalData.toDosByUser?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: GlobalData.toDosByUser[index].completed
                            ? AppColors.green
                            : AppColors.lightGray,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(GlobalData.toDosByUser[index].title),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, position) {
                    return Divider();
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
