import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class AppDateUtil {

  /// 例如:把两时间字符串求出他们的时间差
  /// @param data1Str  '2016-10-11 18:06:03'
  /// @param data2Str  '2015-10-11 18:06:03'
  /// @return number
  static int diff(String date1Str, String date2Str) {
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime date1 = format.parse(date1Str);
    DateTime date2 = format.parse(date2Str);    
    return date1.difference(date2).inSeconds;
  }

  static String YMdhms(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    return format.format(date);
  }

  static String ddhhmmss(int secs) {
    int minutes = secs ~/ 60;
    secs = secs % 60;
    int hours = minutes ~/ 60;
    minutes = minutes % 60;
    int days = hours ~/ 24;
    hours = days > 0 ? hours % 24 : hours;
    return '${days > 0 ? '$days天' : ''}${pad(hours, 2, '0')}:${pad(minutes, 2, '0')}:${pad(secs, 2, '0')}';
  }

  static String dateWithCN(String dateStr) {
    if(dateStr.isNotEmpty) {
      DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
      DateTime date1 = format.parse(dateStr);
      return '${date1.year}年${pad(date1.month, 2, '0')}月${pad(date1.day, 2, '0')}日';
    }
    return dateStr;
  }

  static String pad(int n, int width, String z) {
    String nStr = n.toString();
    return nStr.length >= width ? nStr : z * (width - nStr.length) + nStr;
  }

  static String hhmmss(int secs) {
    int minutes = secs ~/ 60;
    secs = secs % 60;
    int hours = minutes ~/ 60;
    minutes = minutes % 60;
    return '${pad1(hours, 2, '0')}:${pad1(minutes, 2, '0')}:${pad1(secs, 2, '0')}';
  }

  static String pad1(int number, int length, String char) {
    String str = number.toString();
    while (str.length < length) {
      str = char + str;
    }
    return str;
  }

  static String MMddhhmm(String strDate) {
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime date1 = format.parse(strDate);
    return "${pad1(date1.month, 2, '0')}/${pad1(date1.day, 2, '0')} ${pad1(date1.hour, 2, '0')}:${pad1(date1.minute, 2, '0')}";
  }

  static String displayCloseTime(int timestamp) {
    if (timestamp >= 0) {
      int hours = timestamp ~/ (3600);
      int minutes = (timestamp % (3600)) ~/ (60);
      int seconds = (timestamp % (60)) ;
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } 
    return '封盘中';
  }

  static int getCloseTimes(String closeTime) {
    if(closeTime=="" || closeTime=="0") {
      return 0;
    }
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime date1 = format.parse(closeTime);
    DateTime date2 = DateTime.now();
    return date1.difference(date2).inSeconds; 
  }

  static String doubleDigit(int a) {
    if(a<10){
      return '0$a';
    }
    return a.toString();
  }

}
