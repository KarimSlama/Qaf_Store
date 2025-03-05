import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/network/repositories/network_repository.dart';
import 'package:qaf_store/network/services/network_controller/network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final BuildContext context;
  final NetworkRepository networkRepository;

  NetworkCubit({required this.context, required this.networkRepository}) : super(NetworkInitial()) {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      emit(NetworkDisconnected());
    } else {
      emit(NetworkConnected());
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      emit(NetworkDisconnected());
      Loaders.warningSnackBar(
          title: 'No Internet Connection....',
          context: context);
    } else {
      emit(NetworkConnected());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
