import 'package:call_kit_test_project/home_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  // get all permissions required for the app
  _getPermissions();
}

Future<void> _getPermissions() async {
  // Request permissions for Android and iOS
  Map<Permission, PermissionStatus> statuses = await [
    Permission.microphone,
    Permission.phone,
    Permission.notification,
    Permission.camera,
    Permission.location,
  ].request();

  // Check if any permission is denied
  statuses.forEach((permission, status) {
    if (status.isDenied) {
      // Handle the case when permission is denied
      print('$permission is denied.');
      permission.request();
    } else {
      print('$permission is granted.');
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
