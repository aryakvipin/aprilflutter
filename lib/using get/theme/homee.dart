import 'package:aprilflutter/using%20get/theme/themecontroleer.dart';
import 'package:aprilflutter/using%20get/theme/themedata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Obx(
              () => Text(_controller.currentTheme.value == ThemeMode.dark
              ? "Dark Theme"
              : "Light Theme"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap on the switch to change the Theme",
              style: TextStyle(fontSize: size.height * 0.02),
            ),
            Obx(
                  () => Switch(
                value: _controller.currentTheme.value == ThemeMode.dark,
                onChanged: (value) {
                  _controller.switchTheme();
                  Get.changeThemeMode(_controller.currentTheme.value);
                },
                activeColor: CustomTheme.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}