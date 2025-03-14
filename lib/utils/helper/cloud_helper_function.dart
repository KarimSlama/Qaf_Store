import 'package:flutter/material.dart';

class CloudHelperFunction {
  static Widget? checkMultiRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? builder,
      Widget? loading,
      Widget? empty,
      Widget? error}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loading != null) return loading;
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      if (error != null) return error;
      return Center(child: Text('Something went wrong!'));
    }
    if (!snapshot.hasData || snapshot.data!.isEmpty || snapshot.data == null) {
      if (empty != null) return empty;
      return const Center(child: Text('No data found!'));
    }
    return null;
  }
}
