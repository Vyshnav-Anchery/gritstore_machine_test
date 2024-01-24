import 'package:flutter/material.dart';
import 'package:gritstore_machine_test/core/constants/hive_box.dart';
import 'package:gritstore_machine_test/core/database/alaramdb.dart';

class AlarmController extends ChangeNotifier {
  late TimeOfDay selectedTime;
  showTimePickerAlert(BuildContext context) async {
    var selected =
        await showTimePicker(context: context, initialTime: selectedTime);
    selectedTime = selected ?? selectedTime;
    notifyListeners();
  }

  setAlarm({required TimeOfDay time, String? label, required context}) {
    String alarmTime = time.format(context);
    // TimeOfDay.fromDateTime(DateTime.parse(b));
    alarmBox.add(Alaramdb(time: alarmTime, label: label, isActive: true));
  }
}
