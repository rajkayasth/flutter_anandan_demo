import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/learner_model.dart';

class LearnersPage extends StatefulWidget {
  LearnersPage({Key? key, required this.learnerModel}) : super(key: key);

  @override
  State<LearnersPage> createState() => _LearnersPageState();
  final LearnerModel? learnerModel;
}

class _LearnersPageState extends State<LearnersPage> {
  List<LearnerModel> learnerList = [];

  @override
  Widget build(BuildContext context) {
    learnerList.clear();
    learnerList.add(LearnerModel(
        name: "Tome Curse",
        gender: "Male",
        age: "22Years",
        date: "10/april/2023 To 23/april/2023",
        DOB: "31-jan-2023",
        subscriptionTime: "2 months Plan",
        expireText: "Completed",
        expireColor: Colors.green,
        imagePath: "assets/images/man.png"));
    learnerList.add(LearnerModel(
        name: "Jems Bond",
        gender: "Male",
        age: "35 years",
        date: "23/June/2023 To 43/april/2024",
        DOB: "1-jan-2023",
        subscriptionTime: "10 months Plan",
        expireText: "Expired",
        imagePath: "assets/images/person1.png",
        expireColor: Colors.red));
    learnerList.add(LearnerModel(
        name: "Tome Curse",
        gender: "Male",
        age: "22Years",
        date: "10/april/2023 To 23/april/2023",
        DOB: "31-jan-2023",
        subscriptionTime: "2 months Plan",
        expireText: "Completed",
        imagePath: "assets/images/person4.png",
        expireColor: Colors.green));
    learnerList.add(LearnerModel(
        name: "Dakota Johnsan",
        gender: "Male",
        age: "22Years",
        date: "10/april/2023 To 23/april/2023",
        DOB: "31-jan-2023",
        subscriptionTime: "2 months Plan",
        expireText: "Expired",
        imagePath: "assets/images/person4.png",
        expireColor: Colors.red));

    setState(() {
      if (widget.learnerModel != null) {
        learnerList.add(widget.learnerModel!);
      }
    });

    return Scaffold(
      appBar: CustomAppBar(leadingIconTap: () {
        context.push('/selectImage');
      },onTap: () {
        context.push('/quote');
      },title: "Learner List"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Opening Add Learner Page
          context.pushReplacement('/addLearner');
        },
        child: Icon(Icons.add, color: CustomColor.darkBlue, size: 45),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push('/learnerDetail', extra: learnerList[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //userImage
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            learnerList[index].imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  learnerList[index].name,
                                  style: titleTextStyle20(
                                      fontWeight: FontWeight.bold,
                                      textColor: CustomColor.darkBlue),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          learnerList[index].gender,
                                          style: titleTextStyle16(
                                              fontWeight: FontWeight.bold,
                                              textColor: CustomColor.darkGray),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0,
                                            top: 8.0,
                                            right: 8.0,
                                            bottom: 2.0),
                                        child: VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 2,
                                          width: 2,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          learnerList[index].age,
                                          style: titleTextStyle16(
                                              fontWeight: FontWeight.bold,
                                              textColor: CustomColor.darkGray),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Text(
                                    "DOB: ${learnerList[index].DOB}",
                                    style: titleTextStyle16(
                                        textColor: CustomColor.darkBlue),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(minWidth: 80),
                          decoration: BoxDecoration(
                            color: learnerList[index].expireColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Text(
                                learnerList[index].expireText,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "#UserId${learnerList[index].subscriptionTime}",
                      style: titleTextStyle20(
                          textColor: CustomColor.darkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        learnerList[index].date,
                        style: titleTextStyle16(
                            textColor: CustomColor.darkGray,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: learnerList.length,
      ),
    );
  }
}
