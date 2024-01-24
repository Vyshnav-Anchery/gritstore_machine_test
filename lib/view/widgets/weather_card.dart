import 'package:flutter/material.dart';
import 'package:gritstore_machine_test/controllers/weather_controller.dart';
import 'package:provider/provider.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(builder: (context, provider, child) {
      return FutureBuilder(
          future: provider.getWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.amber,
                height: 200,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Container(
                color: Colors.amber,
                height: 200,
                child: const Text(""),
              );
            } else {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () => provider.refresh(),
                              icon: const Icon(Icons.refresh_rounded)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${snapshot.data!.current!.tempC} °C",
                                style: const TextStyle(fontSize: 30),
                              ),
                              Text(
                                snapshot.data!.location!.name.toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                "https:${snapshot.data!.current!.condition!.icon}",
                                color: Colors.white,
                              ),
                              Text(snapshot.data!.current!.condition!.text!)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          });
    });
  }
}
