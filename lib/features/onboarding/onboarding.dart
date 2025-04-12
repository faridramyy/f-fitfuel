import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
        pageBackgroundColor: Colors.black,
        centerBackground: true,
        headerBackgroundColor: Colors.black,
        finishButtonText: '',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        ),
        skipTextButton: Text('Skip', style: TextStyle(color: Colors.white)),
        trailing: Text('Login', style: TextStyle(color: Colors.white)),
        trailingFunction: () {
          Navigator.pushNamed(context, '/login');
        },
        background: [
          Image.asset('assets/images/onboarding/img5 (1).png'),
          Image.asset('assets/images/onboarding/img3 (1).png'),
          Image.asset('assets/images/onboarding/img2 (1).png'),
          Image.asset('assets/images/onboarding/img4 (1).png'),
          Image.asset('assets/images/onboarding/img1 (1).png'),
        ],
        totalPage: 5,
        speed: 1,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Your personal fitness journey starts here. Train smarter, eat better, and get results that last.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Log your workouts, monitor your progress, and stay on top of your goals — all in one place.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Follow a personalized meal plan tailored to your fitness goals and daily lifestyle. Eat smart, train hard.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Get workouts and nutrition advice crafted by AI, just for you. No guesswork — just gains.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SignInButton(
                  Buttons.google,
                  text: "Sign up with Google",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.facebook,
                  text: "Sign up with Facebook",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.apple,
                  text: "Sign up with Apple",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.email,
                  text: "Sign up with Email",
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
