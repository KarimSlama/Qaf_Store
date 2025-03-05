// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:qaf_store/common/widgets/popups/loaders.dart';

// class NetworkManager extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _updateConnectionStatus(List<ConnectivityResult> connectivityResults) async {
//     _connectionStatus.value = connectivityResults.first;
//     if (_connectionStatus.value == ConnectivityResult.none) {
//       Loaders.warrningSnakeBar(
//           title: 'No Internet Connection....', context: Get.context!);
//     }
//   }

//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       if (result == ConnectivityResult.none) {
//         return false;
//       } else
//         return true;
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }
