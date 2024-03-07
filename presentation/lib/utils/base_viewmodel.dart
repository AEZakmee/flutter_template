import 'dart:async';

import 'package:domain/model/handler/data_response.dart';
import 'package:domain/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../model/ui_state.dart';

abstract base class BaseViewModel extends ChangeNotifier {
  bool _isDisposed = false;
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  UIState _uiState = UIState.loading;
  UIState get uiState => _uiState;

  void loading() {
    _uiState = UIState.loading;
    notifyListeners();
  }

  void success() {
    _uiState = UIState.success;
    notifyListeners();
  }

  void failure() {
    _uiState = UIState.error;
    notifyListeners();
  }

  Future<void> init() async {}

  Future<void> loadData<T>(
    Future<DataResponse<T>> Function() fetchData, {
    void Function(T data)? onData,
  }) async {
    final response = await fetchData();

    response.fold(
      onSuccess: (data) {
        if (onData != null) {
          onData(data);
        }
        success();
      },
      onError: (_) {
        failure();
      },
    );
  }

  void addDisposable(StreamSubscription<dynamic> subscription) {
    _subscriptions.add(subscription);
  }

  @override
  void dispose() {
    _isDisposed = true;

    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();

    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }
}
