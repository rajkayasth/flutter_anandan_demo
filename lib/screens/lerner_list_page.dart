import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:flutter/material.dart';

import '../model/learner_model.dart';

class LearnersPage extends StatefulWidget {
  @override
  State<LearnersPage> createState() => _LearnersPageState();
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
        DOB: "31/jan/2023",
        subscriptionTime: "2 months"));
    learnerList.add(LearnerModel(
        name: "Tome Curse",
        gender: "Male",
        age: "22Years",
        date: "10/april/2023 To 23/april/2023",
        DOB: "31/jan/2023",
        subscriptionTime: "2 months"));
    learnerList.add(LearnerModel(
        name: "Tome Curse",
        gender: "Male",
        age: "22Years",
        date: "10/april/2023 To 23/april/2023",
        DOB: "31/jan/2023",
        subscriptionTime: "2 months"));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Learners",
          style: TextStyle(
              color: CustomColor.darkBlue,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "FontMainBold"),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            "assets/images/man.png",
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active,
                color: CustomColor.darkBlue,
              ))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                      child: Image.asset("assets/images/man.png",fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(learnerList[index].name,style: titleTextStyle20(fontWeight: FontWeight.bold,textColor: CustomColor.darkBlue),),
                          IntrinsicHeight(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(learnerList[index].gender,style: titleTextStyle16(fontWeight: FontWeight.bold,textColor: CustomColor.darkGray),),
                              ),
                              const VerticalDivider(color: Colors.red,  thickness: 2, width: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(learnerList[index].age,style: titleTextStyle16(fontWeight: FontWeight.bold,textColor: CustomColor.darkGray),),
                              ),
                            ],
                          ),
                        ),
                      ],),
                    )
                  ],)
                ],
              ),
            ),
          );
        },
        itemCount: learnerList.length,
      ),
    );
  }
}
