import 'package:anandan_demo_flutter/model/UserModel.dart';
import 'package:anandan_demo_flutter/network_services/api_screen.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}


class _UserScreenState extends State<UserScreen> {
  List<UserModel>? userModelList;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    userModelList = await ApiInterface().getUserData();

    if (userModelList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator(),),
          child: ListView.builder(
            itemCount: userModelList?.length,
            itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              color: CustomColor.grayf8f8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userModelList![index].name!,style: const TextStyle(color: CustomColor.darkBlue,fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),
              ),
            );
          },),
        ),
      ),
    );
  }
}
