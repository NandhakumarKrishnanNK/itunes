import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:go_router/go_router.dart';
import 'package:itunes/src/widget/alart_dialoge.dart';

import '../app/router.dart';
import '../app/utils/string_resources.dart';
import '../widget/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    // Navigate to the home screen after the animation is complete
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        GoRouter.of(context).go(AppRoutes.homeScreen);
      }
    });
  }

  Future<void> checkJailBreak() async {
    bool jailbroken;
    bool developerMode;
    try {
      jailbroken = await FlutterJailbreakDetection.jailbroken;
      developerMode = await FlutterJailbreakDetection.developerMode;
      // print('CheckJailBreak Called ----> $jailbroken  ---  $developerMode');
    } on PlatformException {
      jailbroken = true;
      developerMode = true;
    }

    if (mounted) {
      setState(() {});
    }

    if (jailbroken || developerMode) {
      await DialogWidget.showDialog(
          // ignore: use_build_context_synchronously
          buildContext: AppRoutes().context,
          title: 'Error!',
          description: 'Rooted device/DeveloperMode is Enabled',
          okBtnText: 'Close',
          okBtnFunction: (val) {
            Navigator.of(context, rootNavigator: true).pop();
          });
    }

    // setState(() {
    //   checkJailbroken = jailbroken;
    //   checkDeveloperMode = developerMode;
    // });
    // print(
    //     'CheckJailBreak Called After Complete ----> $checkJailbroken  ---  $checkDeveloperMode');
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: FadeTransition(
          opacity: _animation,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: StringResource.m2p,
                textStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              TextWidget(
                text: StringResource.itunesFlutterAssignment,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white38,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
