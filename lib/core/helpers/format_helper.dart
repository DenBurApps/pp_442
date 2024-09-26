import 'package:intl/intl.dart';

class FormatHelper {
  static String formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static String formatDateAndTime(DateTime date) {
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }

  static String formatDateCustom(DateTime date) {
    return '${DateFormat('dd').format(date)} ${DateFormat('MMMM').format(date).substring(0, 4)}';
  }

  static String formatDateWeekday(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  static String formatDateShort(DateTime date) {
    return DateFormat('dd MMM').format(date);
  }

  static String formatDateMonthFull(DateTime date) {
    return DateFormat('MMMM, yyyy').format(date);
  }

  static String formatDateMonthShort(DateTime date) {
    return DateFormat('MMM').format(date);
  }

  static String formatDateWithSuffix(DateTime date) {
    String dayWithSuffix = _getDayWithSuffix(date.day);
    String month = DateFormat('MMMM').format(date);
    return '$month $dayWithSuffix';
  }

  static String formatNumber(num input) {
    if (input is int) {
      return input.toString();
    } else if (input % 1 == 0) {
      return input.toInt().toString();
    } else {
      return input.toStringAsFixed(2);
    }
  }

  static String formatDuration(Duration duration) {
    final int hours = duration.inSeconds ~/ 3600;
    final int minutes = (duration.inSeconds % 3600) ~/ 60;
    final int seconds = duration.inSeconds % 60;

    List<String> parts = [];
    if (hours > 0) {
      parts.add('$hours hr${hours > 1 ? 's' : ''}');
    }
    if (minutes > 0) {
      parts.add('$minutes min${minutes > 1 ? 's' : ''}');
    }
    if (seconds > 0) {
      parts.add('$seconds sec${seconds > 1 ? 's' : ''}');
    }

    return parts.isNotEmpty ? parts.join(' ') : '0 sec';
  }

  static String _getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
}
