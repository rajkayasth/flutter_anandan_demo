import 'package:anandan_demo_flutter/screens/singup_screen.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePass = FocusNode();
  final _formStateKey = GlobalKey<FormState>();
  Color _borderColor = Colors.grey;
  Color _borderColorPass = Colors.grey;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');


  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {
        _borderColor = _focusNodeEmail.hasFocus ? darkBlue : Colors.grey;
      });
    });
    _focusNodePass.addListener(() {
      setState(() {
        _borderColorPass = _focusNodePass.hasFocus ? darkBlue : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use it to change color for border when textFiled in focus

    return Scaffold(
      body: Form(
        key: _formStateKey,
        child: Container(
          color: Colors.white,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Login Image
                Stack(
                  children: [
                    Container(
                      height: 375,
                      width: double.maxFinite,
                      child: Image.asset("assets/images/login_image.png"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 20,
                      left: 0,
                      child: Container(
                        height: 60,
                        width: 50,
                        child: Image.asset("assets/images/signin_image.png"),
                      ),
                    ),
                  ],
                ),
                //Sign Up Text And Don't have account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have An Account?",
                      style: titleTextStyle16()
                          .copyWith(fontFamily: 'FontMainBold'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: titleTextStyle20(textColor: darkBlue)
                            .copyWith(fontFamily: 'FontMainBold'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //Text Fields Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    focusNode: _focusNodeEmail,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email id",
                      labelText: "Email ID",
                      hintStyle: TextStyle(color: lightGray55),
                      labelStyle: TextStyle(color: _borderColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: darkBlue),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: lightGray)),
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please Enter Email";
                      }
                      else{
                        if(!emailRegex.hasMatch(value)){
                          return "Please Enter Valid EmailId";
                        }else{
                          return null;
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    focusNode: _focusNodePass,
                    controller: passController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter Password";
                      }
                      else{
                        if(!passRegex.hasMatch(value)){
                          return "Please Enter Valid Password";
                        }else{
                          return null;
                        }
                      }
                    },

                    decoration: textFieldBorder(
                      borderColor: _borderColorPass,
                      suffixIcon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Forgot Password Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                            decoration: TextDecoration.underline,
                            fontFamily: "FontMainBold"),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //Button Login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(darkBlue),
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                            decoration: TextDecoration.underline,
                            fontFamily: "FontMainBold"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
