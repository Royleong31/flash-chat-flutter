import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widgets/welcome_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // upperBound: 100,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    // controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flutter Chat',
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        )),
                    // TypewriterAnimatedText('Design first, then code'),
                    // TypewriterAnimatedText(
                    //     'Do not patch bugs out, rewrite them'),
                    // TypewriterAnimatedText(
                    //     'Do not test bugs out, design them out'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WelcomeButton(
                title: 'Log In',
                onPressed: () =>
                    Navigator.of(context).pushNamed(LoginScreen.routeName),
                color: Colors.lightBlueAccent),
            WelcomeButton(
                title: 'Register',
                onPressed: () => Navigator.of(context)
                    .pushNamed(RegistrationScreen.routeName),
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
