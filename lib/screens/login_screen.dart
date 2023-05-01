import 'package:anandan_demo_flutter/screens/singup_screen.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

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
  bool _invalidValue = false;

  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {
        _borderColor = _focusNodeEmail.hasFocus ? CustomColor.darkBlue : Colors.grey;
      });
    });
    _focusNodePass.addListener(() {
      setState(() {
        _borderColorPass = _focusNodePass.hasFocus ? CustomColor.darkBlue : Colors.grey;
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
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));*/

                        context.go('/signUp');
                      },
                      child: Text(
                        "Sign Up",
                        style: titleTextStyle20(textColor: CustomColor.darkBlue)
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
                    decoration:  InputDecoration(
                      hintText: "Enter Email Id",
                      labelText: "Email",
                      border:OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Email";
                      } else {
                        if (!emailRegex.hasMatch(value)) {
                          return "Please Enter Valid EmailId";
                        } else {
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

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else {
                        if (!passRegex.hasMatch(value)) {
                          return "Please Enter Valid Password";
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,

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
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(21),
                                topRight: Radius.circular(21),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: InkWell(
                                              child: Icon(Icons.close,
                                                  color: CustomColor.darkBlue),
                                              onTap: () {
                                                Navigator.pop(context);
                                              }),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 75.0),
                                          child: Text(
                                            "Forgot Password",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Color(0xff1E4884)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: TextFormField(
                                        /*focusNode: _focusNodeEmail,
                  controller: emailController,*/

                                        decoration: InputDecoration(
                                          hintText: "Enter Email Id",
                                          labelText: "Email Id",
                                          floatingLabelBehavior: FloatingLabelBehavior.never,
                                          hintStyle:
                                              TextStyle(color: CustomColor.lightGray55),
                                          labelStyle:
                                          TextStyle(color: _invalidValue ? Colors.red : Colors.blue),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            borderSide:
                                                BorderSide(color: CustomColor.darkBlue),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              borderSide:
                                                  BorderSide(color: CustomColor.lightGray)),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            _invalidValue = true;
                                            return "Please Enter Email";
                                          } else {
                                            if (!emailRegex.hasMatch(value)) {
                                              _invalidValue = true;
                                              return "Please Enter Valid EmailId";
                                            } else {
                                              return null;
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 32),
                                      width: double.maxFinite,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color(0xff1E4884))),
                                        child: const Text("SEND"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.darkBlue,
                              decoration: TextDecoration.underline,
                              fontFamily: "FontMainBold"),
                        ),
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
                      onPressed: () {
                        /*showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                //this right here
                                child: Container(
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            "Do you want to add the learner?",
                                            style: TextStyle(
                                                color: Color(0xff1E4884),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [

                                              SizedBox(
                                                width: 140,
                                                child: OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: OutlinedButton.styleFrom(
                                                      side: BorderSide(
                                                          color: darkGray,
                                                          width: 1)),
                                                  child: const Text(
                                                    "CANCEL",
                                                    style: TextStyle(
                                                        color: Color(0xff1E4884),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 140,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(

                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                      Color(0xff1E4884),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "OKAY",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });*/
                        if(_formStateKey.currentState!.validate()){
                          _invalidValue = false;
                         /* Toast.show("Validation Item",
                              duration: Toast.lengthShort, gravity: Toast.bottom);*/
                          context.go('/learnerList');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(CustomColor.darkBlue),
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
                      child: InkWell(
                        onTap: () => context.pushReplacement('/learnerList'),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.darkBlue,
                              decoration: TextDecoration.underline,
                              fontFamily: "FontMainBold"),
                        ),
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
