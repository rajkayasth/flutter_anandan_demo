import 'package:anandan_demo_flutter/model/image_model.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<UserImage> userImageList = [];
  int currentStep = 0;
  final FocusNode _focusNodeEmail = FocusNode();
  Color _borderColor = Colors.grey;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final dateController = TextEditingController();
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passRegex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'Other',
  ];
  String dropdownvalue = 'Item 1';

  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {
        _borderColor = _focusNodeEmail.hasFocus ? darkBlue : Colors.grey;
      });
    });
    /*_focusNodePass.addListener(() {
      setState(() {
        _borderColorPass = _focusNodePass.hasFocus ? darkBlue : Colors.grey;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    userImageList.clear();
    userImageList.add(UserImage(imagePath: "assets/images/man.png"));
    userImageList.add(UserImage(imagePath: "assets/images/woman.png"));
    userImageList.add(UserImage(imagePath: "assets/images/man.png"));
    userImageList.add(UserImage(imagePath: "assets/images/woman.png"));
    userImageList.add(UserImage(imagePath: "assets/images/person1.png"));
    userImageList.add(UserImage(imagePath: "assets/images/person2.png"));
    userImageList.add(UserImage(imagePath: "assets/images/person3.png"));
    userImageList.add(UserImage(imagePath: "assets/images/person4.png"));

    List<Step> getSteps() =>
        [
          Step(
              isActive: currentStep >= 0,
              title: const Text(""),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Choose Profile icon',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff54606C)),
                          ),
                          TextSpan(
                              text: '  *',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: userImageList.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: lightGray55)),
                          child: Image.asset(
                            userImageList[index].imagePath,
                            width: 30,
                            height: 30,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Enter your basic details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xff54606C)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //TextFields
                    TextFormField(
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      /*focusNode: _focusNodeEmail,
                  controller: emailController,*/
                      decoration: InputDecoration(
                        hintText: "Enter your Mobile number",
                        labelText: "Mobile Number",
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      /*    focusNode: _focusNodeEmail,
                  controller: emailController,*/
                      decoration: InputDecoration(
                        hintText: "Enter your Password",
                        labelText: "Password",
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
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: _borderColor,
                      ),
                      decoration: InputDecoration(
                        hintText: "Select",
                        labelText: "Sex",
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
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    TextFormField(
                      /*    focusNode: _focusNodeEmail,*/
                      controller: dateController,
                      keyboardType: TextInputType.none,

                      onTap: () async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2024));
                        if (datePicked != null) {
                          print(
                              "${datePicked.year} ${datePicked.day} ${datePicked
                                  .month}");
                          dateController.text = "${datePicked.year}/${datePicked.month}/${datePicked.day}";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Date Of Birth",
                        labelText: "DOB",
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
                  ],
                ),
              ),
              label: const Text(
                "Personal Details",
                style: TextStyle(
                    color: Color(0xff54606C), fontWeight: FontWeight.bold),
              )),
          Step(
              isActive: currentStep >= 1,
              title: const Text(""),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Choose Profile icon',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff54606C)),
                        ),
                        TextSpan(
                            text: '  *',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  /*GridView.builder(
                    shrinkWrap: true,
                    itemCount: userImageList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGray55)),
                        child: Image.asset(
                          userImageList[index].imagePath,
                          width: 30,
                          height: 30,
                        ),
                      );
                    },
                  ),*/
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Enter your basic details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff54606C)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //TextFields
                  TextFormField(
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    /*focusNode: _focusNodeEmail,
                  controller: emailController,*/
                    decoration: InputDecoration(
                      hintText: "Enter your Mobile number",
                      labelText: "Mobile Number",
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    /*    focusNode: _focusNodeEmail,
                  controller: emailController,*/
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                      labelText: "Password",
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
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: _borderColor,
                    ),
                    decoration: InputDecoration(
                      hintText: "Select",
                      labelText: "Sex",
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
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  TextFormField(
                    /*    focusNode: _focusNodeEmail,*/
                    controller: dateController,
                    keyboardType: TextInputType.none,

                    onTap: () async {
                      DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2024));
                      if (datePicked != null) {
                        print(
                            "${datePicked.year} ${datePicked.day} ${datePicked
                                .month}");
                        dateController.text = "${datePicked.year}/${datePicked.month}/${datePicked.day}";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Date Of Birth",
                      labelText: "DOB",
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
                ],
              ),
              label: const Text("Address Details")),
        ];

    return Scaffold(
      body: Theme(
        data: ThemeData(
          canvasColor: Colors.white,
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Color(0xff1E4884),
            background: darkGray,
            secondary: Color(0xff1E4884),
          ),
        ),
        child: Stepper(
          controlsBuilder: (context, details) {
            return ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(darkBlue),
                ),
                onPressed: () {
                  final isLastStep = currentStep == getSteps().length - 1;
                  if (isLastStep) {
                    print("Completed");
                  } else {
                    setState(() {
                      currentStep += 1;
                      print(currentStep);
                    });
                  }
                },
                child: const Text("Next"));
          },
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              print("Completed");
            } else {
              setState(() {
                currentStep += 1;
                print(currentStep);
              });
            }
          },
          onStepCancel: () {
            if (currentStep == 0) {} else {
              setState(() {
                currentStep -= 1;
                print(currentStep);
              });
            }
          },
        ),
      ),
    );
  }
}

/*
*/
