import 'package:anandan_demo_flutter/model/learner_model.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class LearnerDetails extends StatefulWidget {
  LearnerDetails({Key? key, required this.learnerModel}) : super(key: key);

  @override
  State<LearnerDetails> createState() => _LearnerDetailsState();

  final LearnerModel learnerModel;
}

class _LearnerDetailsState extends State<LearnerDetails> {
  List<DiagonsisModel> diagnosisList = [];

  @override
  Widget build(BuildContext context) {
    diagnosisList.clear();
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    diagnosisList.add(DiagonsisModel(name: "Diagnosis 1"));
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Name And Profile
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  //userImage
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      widget.learnerModel.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.learnerModel.name,
                            style: titleTextStyle20(
                                fontWeight: FontWeight.bold,
                                textColor: CustomColor.darkBlue),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    widget.learnerModel.gender,
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
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    widget.learnerModel.age,
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
                              "DOB: ${widget.learnerModel.DOB}",
                              style: titleTextStyle16(
                                  textColor: CustomColor.darkBlue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //card For subscription details
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: CustomColor.lightGray,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subscription Type",
                        style: titleTextStyle16(
                            textColor: CustomColor.darkGray,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        constraints: const BoxConstraints(minWidth: 80),
                        decoration: BoxDecoration(
                          color: widget.learnerModel.expireColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              widget.learnerModel.expireText,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      widget.learnerModel.subscriptionTime,
                      style: titleTextStyle20(
                          textColor: CustomColor.darkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Subscription ID",
                              style: titleTextStyle16(
                                  textColor: CustomColor.darkGray,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("#SubId1234"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date",
                              style: titleTextStyle16(
                                  textColor: CustomColor.darkGray,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("19-09-2023"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End Date",
                              style: titleTextStyle16(
                                  textColor: CustomColor.darkGray,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("19-11-2023"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                      ),
                      child: const Text(
                        "PURCHASE NEW SUBSCRIPTION",
                        style: TextStyle(
                            color: CustomColor.darkBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Other List Content
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Text(
                "Diagonisis",
                style: titleTextStyle16(
                    textColor: CustomColor.darkGray,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                        child: Text(diagnosisList[index].name),
                      ),
                      const Divider(
                        thickness: 1,
                        color: CustomColor.grayLight,
                      )
                    ],
                  ),
                );
              },
              itemCount: diagnosisList.length,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Text(
                "Extra Note",
                style: titleTextStyle16(
                    textColor: CustomColor.darkGray,
                    fontWeight: FontWeight.bold),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0,bottom: 16.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum",
                style: titleTextStyle16(
                    textColor: CustomColor.darkGray,
                    fontWeight: FontWeight.w500),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
