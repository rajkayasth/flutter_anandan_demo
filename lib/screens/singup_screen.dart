import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              //Text For Choose Icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Choose Profile icon',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: darkGray),
                      ),
                      const TextSpan(
                          text: '  *',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              //Grid layout for selecting Image
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Container(
                  height: 210,
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/man.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/woman.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/man.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/woman.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/man.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/woman.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/man.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          "assets/images/woman.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Enter your basic details",
                  style: titleTextStyle16(textColor: darkGray,fontWeight: FontWeight.bold),
                ),
              ),
              //TextField
            ],
          ),
        ),
      ),
    );
  }
}
