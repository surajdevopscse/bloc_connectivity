import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Gained, Lost }

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _streamSubscription;
  final Connectivity _connectivity = Connectivity();
  InternetCubit() : super(InternetState.Initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.mobile) {
        emit(InternetState.Gained);
      } else {
        emit(InternetState.Lost);
      }
    });
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
