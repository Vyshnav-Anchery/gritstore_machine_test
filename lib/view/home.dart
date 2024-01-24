import 'package:flutter/material.dart';
import 'package:gritstore_machine_test/view/widgets/refactor_appbar.dart';
import 'package:gritstore_machine_test/view/widgets/weather_card.dart';
import 'widgets/add_alarm_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Alarmy")),
      appBar: const RefactorAppbar(title: "Alarmy"),
      floatingActionButton: const AddAlarm(),
      body: Column(
        children: [const WeatherCard(), Expanded(child: Container())],
      ),
    );
  }
}
