import 'package:anandan_demo_flutter/model/learner_model.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddLearnerPage extends StatefulWidget {
  const AddLearnerPage({Key? key}) : super(key: key);

  @override
  State<AddLearnerPage> createState() => _AddLearnerPageState();
}

class _AddLearnerPageState extends State<AddLearnerPage> {
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePass = FocusNode();
  final _formStateKey = GlobalKey<FormState>();
  final subscriptionController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final genderController = TextEditingController();
  Color _borderColor = Colors.grey;
  Color _borderColorPass = Colors.grey;
  var DOB = "";
  String dropdownvalue = '';
  var items = [
    'Male',
    'Female',
    'Other',
  ];

  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {
        _borderColor =
            _focusNodeEmail.hasFocus ? CustomColor.darkBlue : Colors.grey;
      });
    });
    _focusNodePass.addListener(() {
      setState(() {
        _borderColorPass =
            _focusNodePass.hasFocus ? CustomColor.darkBlue : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _formStateKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Enter Name TextField
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: customTextFieldStyle(
                      hintText: "Enter Learner Name",
                      labelText: "Name",
                      isLabelSelected: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    } else {
                      if (value.length <= 3) {
                        return "Please Enter Valid Name";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
              ),
              //Textfield Gender
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: _borderColor,
                  ),

                  decoration: customTextFieldStyle(
                      hintText: "Select",
                      labelText: "Sex",
                      isLabelSelected: true),
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
                  validator: (value) {
                    value = dropdownvalue;
                    if (value.isEmpty) {
                      return "Please Select Gender";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              //TextField For Date Of Birth
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: TextFormField(
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
                          "${datePicked.year} ${datePicked.day} ${datePicked.month}");
                      dateController.text =
                          "${datePicked.year}/${datePicked.month}/${datePicked.day}";
                    }
                  },
                  decoration: customTextFieldStyle(
                          hintText: "Select Date Of Birth",
                          labelText: "Date Of Birth",
                          isLabelSelected: true)
                      .copyWith(suffixIcon: Icon(Icons.calendar_month)),
                  validator: (value) {
                    value = dateController.text.toString();
                    if (value.isEmpty) {
                      return "Please Enter Email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              //Enter Name TextField
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: TextFormField(
                  controller: subscriptionController,
                  decoration: customTextFieldStyle(
                      hintText: "Subscription Plan",
                      labelText: "Subscription",
                      isLabelSelected: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    } else {
                      if (value.length <= 3) {
                        return "Please Enter Valid Name";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 40,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formStateKey.currentState!.validate()) {
                      var name = nameController.text.toString();
                      var gender = dropdownvalue.toString();
                      var subscriptionDate =
                          subscriptionController.text.toString();
                      var dob = dateController.text.toString();
                      var imagePath = "assets/images/person1.png";
                      var date = "23/June/2023 To 43/april/2024";
                      var age = "32 Years";
                      var expireText = "Expired";
                      var expireColor = Colors.red;
                      context.pushReplacement('/learnerList',
                          extra: LearnerModel(
                              name: name,
                              gender: gender,
                              age: age,
                              date: date,
                              DOB: dob,
                              subscriptionTime: subscriptionDate,
                              expireText: expireText,
                              expireColor: expireColor,
                              imagePath: imagePath));
                    }
                  },
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    backgroundColor:
                        MaterialStateProperty.all(CustomColor.darkBlue),
                  ),
                  child: const Text("Add Learner"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
