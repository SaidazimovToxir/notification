import 'package:flutter/material.dart';
import 'package:lesson69/services/local_notifications_services.dart';
import 'package:lesson69/views/screens/motivation_screen.dart';
import 'package:lesson69/views/screens/pomodoro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationsServices.requestPermission();
  await LocalNotificationsServices.start();
  // LocalNotificationsServices.scheduleDailyMotivationNotification();
  // LocalNotificationsServices.scheduleTestNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PomodoroScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          LocalNotificationsServices.scheduleNotification();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
