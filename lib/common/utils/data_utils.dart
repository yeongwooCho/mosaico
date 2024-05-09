import 'dart:math';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class DataUtils {
  static String convertDateTimeToDateString({
    required DateTime datetime,
  }) {
    return '${datetime.year}.${datetime.month.toString().padLeft(2, '0')}.${datetime.day.toString().padLeft(2, '0')}';
  }

  static String convertDateTimeToDateTimeString({
    required DateTime datetime,
  }) {
    return '${datetime.year}.${datetime.month.toString().padLeft(2, '0')}.${datetime.day.toString().padLeft(2, '0')} ${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
  }

  static String convertPriceToMoneyString({
    required int price,
  }) {
    final NumberFormat numberFormat = NumberFormat('###,###,###,###');

    return numberFormat.format(price);
  }

  static String getUuid() {
    const uuid = Uuid();
    return uuid.v4();
  }

  static int getRandomNumber({
    required int dividerNumber,
  }) {
    final randomObj = Random();
    return randomObj.nextInt(dividerNumber);
  }

  static List<String> getRandomId({
    required int dividerNumber,
    required int count,
  }) {
    final randomObj = Random();

    final List<String> ids = [];

    for (int i = 0; i < count; i++) {
      ids.add(randomObj.nextInt(dividerNumber).toString());
    }

    return ids;
  }
}
