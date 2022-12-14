import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intermediate/action_chip/action_chip_example.dart';
import 'package:flutter_intermediate/expansion_panel/expansion_panel_example.dart';
import 'package:flutter_intermediate/grid_view/grid_view.dart';
import 'package:flutter_intermediate/popup_menu_button/popup_menu_button.dart';
import 'package:flutter_intermediate/slider_indicator/slider_indicator.dart';
import 'package:flutter_intermediate/stepper/stepper.dart';
import 'package:flutter_intermediate/tab_bar_view/tab_bar_view.dart';
import 'package:flutter_intermediate/timer/indicator_timer.dart';

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
                      builder: (context) => const ActionChipExample(),
                    ),
                  );
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
                      builder: (context) => const SliderIndicator(),
                    ),
                  );
                }),

            const SizedBox(height: 20),

            //Popup Menu Button example
            ElevatedButton.icon(
                label: const Text('Popup Menu Button'),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PopupMenuButtonExample(),
                    ),
                  );
                }),

            const SizedBox(height: 20),

            //Timer Progress Bar
            ElevatedButton.icon(
                label: const Text('Timer Progress Bar'),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IndicatorTimerExample(),
                    ),
                  );
                }),

            const SizedBox(height: 20),

            //Expansion Panel
            ElevatedButton.icon(
                label: const Text('Expansion Panel'),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpansionPanelExample(),
                    ),
                  );
                }),

            const SizedBox(height: 20),

            //Tab bar view
            ElevatedButton.icon(
                label: const Text('Tab bar view'),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabBarViewExample(),
                    ),
                  );
                }),

            const SizedBox(height: 20),

            //Stepper
            ElevatedButton.icon(
                label: const Text('Stepper'),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StepperExample(),
                    ),
                  );
                }),

            const SizedBox(height: 20),

            //Grid View
            ElevatedButton.icon(
                label: const Text('Grid View'),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GridViewExample(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
