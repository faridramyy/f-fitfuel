import 'package:fitfuel/routes/app_router.dart';
import 'package:fitfuel/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        pageBackgroundColor: Colors.black,
        centerBackground: true,
        headerBackgroundColor: Colors.black,
        finishButtonText: '',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.transparent,
        ),
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(color: Colors.white),
        ),
        trailing: const Text('Login', style: TextStyle(color: Colors.white)),
        trailingFunction: () => Navigator.pushNamed(context, AppRoutes.login),
        background: [
          Image.asset('assets/images/onboarding/img5 (1).png'),
          Image.asset('assets/images/onboarding/img3 (1).png'),
          Image.asset('assets/images/onboarding/img2 (1).png'),
          Image.asset('assets/images/onboarding/img4 (1).png'),
          Image.asset('assets/images/onboarding/img1 (1).png'),
        ],
        totalPage: 5,
        speed: 1,
        pageBodies: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (index < 4)
                  Text(
                    _getPageText(index),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: AppSizes.fontXL,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                else
                  Column(
                    children: [
                      SignInButton(
                        Buttons.google,
                        text: "Sign up with Google",
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SignInButton(
                        Buttons.facebook,
                        text: "Sign up with Facebook",
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),

                      SignInButton(
                        Buttons.apple,
                        text: "Sign up with Apple",
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),

                      SignInButton(
                        Buttons.email,
                        text: "Sign up with Email",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),

                      SignInButton(
                        Buttons.anonymous,
                        text: "Sign up as a Guest",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getPageText(int index) {
    switch (index) {
      case 0:
        return 'Your personal fitness journey starts here. Train smarter, eat better, and get results that last.';
      case 1:
        return 'Log your workouts, monitor your progress, and stay on top of your goals — all in one place.';
      case 2:
        return 'Follow a personalized meal plan tailored to your fitness goals and daily lifestyle. Eat smart, train hard.';
      case 3:
        return 'Get workouts and nutrition advice crafted by AI, just for you. No guesswork — just gains.';
      default:
        return '';
    }
  }
}
