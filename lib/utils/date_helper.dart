import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class DateHelper {
  static String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static Future<void> showBirthdayPicker({
    required BuildContext context,
    required void Function(DateTime) onDateTimeChanged,
    DateTime? initialDate,
  }) async {
    if (Platform.isAndroid) {
      final birthDate = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: DateConstants.firstDate,
        lastDate: DateTime.now(),
      );
      if (birthDate != null) {
        onDateTimeChanged(birthDate);
      }
    } else {
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (_) {
          return Container(
            height: 150,
            color: NAColors.lightBlue,
            child: CupertinoDatePicker(
              onDateTimeChanged: onDateTimeChanged,
              initialDateTime: initialDate ?? DateTime.now(),
              minimumYear: DateConstants.firstDate.year,
              maximumYear: DateTime.now().year,
              mode: CupertinoDatePickerMode.date,
              backgroundColor: Colors.white,
            ),
          );
        },
      );
    }
  }

  static String getFormattedBirthDate({required DateTime? birthDate}) {
    if (birthDate != null) {
      final month = DateFormat.MMMM().format(birthDate);
      final date =
          birthDate.day.toString() + getDayOfMonthSuffix(birthDate.day);
      final year = birthDate.year;
      return '$month $date, $year';
    }
    return '';
  }
}

class DateConstants {
  /// First Date for DatePicker
  static DateTime firstDate = DateTime(1800);
}
