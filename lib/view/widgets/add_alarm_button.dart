import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gritstore_machine_test/controllers/alarm_controller.dart';
import 'package:provider/provider.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late AlarmController alarmController;

  @override
  void initState() {
    alarmController = Provider.of<AlarmController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return FloatingActionButton(
      tooltip: "Add New Alarm",
      child: const Icon(Icons.add),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            alarmController.selectedTime = TimeOfDay.now();
            return AlertDialog(
              title: const Text("Set Alarm"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row(
                  //   children: [
                  //     Text("$_selectedTime"),
                  //     // TextButton(
                  //     //     onPressed: () {}, child: const Text("Set Time"))
                  //   ],
                  // ),
                  InkWell(
                    onTap: () => alarmController.showTimePickerAlert(context),
                    child: Consumer<AlarmController>(
                        builder: (context, controller, child) {
                      return Card(
                        color: Colors.grey.shade600,
                        elevation: 2,
                        child: SizedBox(
                          height: 60,
                          child: Center(
                              child: Text(
                            alarmController.selectedTime.format(context),
                            // "06:22",
                            style: GoogleFonts.orbitron(fontSize: 40),
                          )),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Label"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () => alarmController.setAlarm(
                        context: context,
                        label: textEditingController.text,
                        time: alarmController.selectedTime),
                    child: const Text("Set")),
              ],
            );
          },
        );
      },
    );
  }
}
