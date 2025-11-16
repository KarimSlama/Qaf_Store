import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

class QafHelperFunctions {
  static Color? getColor(String value) {
    switch (value) {
      case 'Green':
        return Colors.green;
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Pink':
        return Colors.pink;
      case 'Purple':
        return Colors.purple;
      case 'Amber':
        return Colors.amber;
      case 'Orange':
        return Colors.deepOrange;
      case 'White':
        return Colors.white;
      case 'Black':
        return Colors.black;
      case 'Brown':
        return Colors.brown;

      default:
        return null;
    }
  }

  static void showSnackBar(String message, context) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlertDialog(String title, String message, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength)
      return text;
    else
      return '${text.substring(0, maxLength)}...';
  }

  static bool isDark(context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidget(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(
        Row(
          children: rowChildren,
        ),
      );
    }
    return wrappedList;
  }

  static String formatTime(DateTime timestamp) {
    return DateFormat('hh:mm a').format(timestamp);
  }
}
