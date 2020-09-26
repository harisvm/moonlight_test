import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/domain/repositories/repository.dart';

part 'user_detail_event.dart';

part 'user_detail_state.dart';

class UserFeedBloc extends Bloc<UserFeedEvent, UserFeedState> {
  @override
  Stream<UserFeedState> mapEventToState(
    UserFeedEvent event,
  ) async* {
    yield InitialUserFeedState();

    if (event is LoadUserFeed) {
      try {
        GlobalData.userDetailModel = await Repository().getUserDetails();

        yield UserFeedLoaded();
      } catch (e) {
        print('---e---$e');

        yield CommonErrorState();

      }
    }
  }

  @override
  UserFeedState get initialState => InitialUserFeedState();
}
