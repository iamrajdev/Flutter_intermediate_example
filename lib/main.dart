import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intermediate/action_chip/action_chip_example.dart';
import 'package:flutter_intermediate/slider_indicator/slider_indicator.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Intermediate"),
        ),
        body: const HomePage(),
      ),
    );
  }
}

/// Main page [HomePage]
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          children: [
            //Action chip example
            ElevatedButton.icon(
                label: const Text('Action chip '),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActionChipExample()));
                }),

            const SizedBox(height: 20),

            //Slider & Indicator example
            ElevatedButton.icon(
                label: const Text('Slider & Indicator'),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SliderIndicator()));
                }),
          ],
        ),
      ),
    );
  }
}
