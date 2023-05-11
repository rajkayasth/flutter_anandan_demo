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
              elevation: 2,
              margin: const EdgeInsets.all(10),
              color: CustomColor.lightGray,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userModelList![index].name!,style: const TextStyle(color: CustomColor.darkBlue,fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 5,),
                    Text(userModelList![index].email!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                    SizedBox(height: 5,),
                    Text(userModelList![index].website!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                    Container(
                      height: 100,
                      margin: EdgeInsets.all(5),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5),),
                        border: Border.all(color: CustomColor.darkGray,width: 1)
                      ),
                      child: Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("ADDRESS ",style: TextStyle(color: CustomColor.darkBlue,fontWeight: FontWeight.w700,fontSize: 16),),
                                  Text(userModelList![index].address!.street!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                                  const SizedBox(width: 5,),
                                  Text(userModelList![index].address!.city!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,left: 8.0,right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(userModelList![index].address!.suite!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                                  const SizedBox(width: 5,),
                                  Text(userModelList![index].address!.zipcode!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,left: 8.0,right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(userModelList![index].address!.geo!.lat!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                                  const SizedBox(width: 5,),
                                  Text(userModelList![index].address!.geo!.lng!,style: const TextStyle(color: CustomColor.darkGray,fontWeight: FontWeight.w400,fontSize: 16),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

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
