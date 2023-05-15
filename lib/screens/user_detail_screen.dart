// ignore_for_file: use_build_context_synchronously

import 'package:anandan_demo_flutter/model/Data.dart';
import 'package:anandan_demo_flutter/model/UserImageModel.dart';
import 'package:anandan_demo_flutter/model/UserLIstResponse.dart';
import 'package:anandan_demo_flutter/network_services/api_screen.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  List<UserImageModel>? userImageList;
  List<Data>? userDataList;
  var isLoaded = false;
  var nameTextController = TextEditingController();
  var jobTextController = TextEditingController();
  bool _invalidValue = false;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    // userImageList = await ApiInterface().getUserImageData();

    var userListResponse = await ApiInterface().getUserListResponse();

    // debugPrint("USER_LIST_REPONSE ${userListResponse as UserListResponse}");

    /* if (userImageList != null) {
      setState(() {
        isLoaded = true;
      });
    }*/

    if (userListResponse != null) {
      userDataList = userListResponse.data;
      if (userDataList != null) {
        setState(() {
          isLoaded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: CustomAppBar(
          onTap: () {},
          title: "API CALL USING DIO",
          leadingIconTap: () {},
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              isDismissible: false,
              barrierColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                // <-- SEE HERE
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
              ),
              builder: (context) {
                return Form(
                  key: formKey,
                  child: SizedBox(
                    height: 500,
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            controller: nameTextController,
                            decoration: customTextFieldStyle(
                                hintText: "Enter Your EmailId",
                                labelText: "Email Id",
                                isLabelSelected: _invalidValue),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Name";
                              } else {
                                if (value.length <= 2) {
                                  return "Please Enter Valid Name";
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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            controller: jobTextController,
                            decoration: customTextFieldStyle(
                                hintText: "Enter Your JOB Title",
                                labelText: "Job",
                                isLabelSelected: _invalidValue),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Job Title";
                              } else {
                                if (value.length <= 5) {
                                  return "Please Enter Valid Job Title";
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
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          width: double.maxFinite,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                _invalidValue = false;

                                debugPrint(
                                    "${nameTextController.text}\n${jobTextController.text}");

                                var userPostResponse = await ApiInterface()
                                    .getUserPostResponse(
                                        nameTextController.text.toString(),
                                        jobTextController.text.toString());

                                context.push("/userPostScreen",
                                    extra: userPostResponse);

                                Navigator.pop(context);
                                nameTextController.text = "";
                                jobTextController.text = "";
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff1E4884))),
                            child: const Text("SEND"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.yellow,
          child: const Icon(
            Icons.add,
            size: 25,
            color: CustomColor.darkBlue,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          child: Visibility(
            visible: isLoaded,
            replacement: const Center(child: CircularProgressIndicator()),
            child: InkWell(
              onTap: () {} /* => context.push("/userPostScreen")*/,
              child: ListView.builder(
                itemCount: userDataList?.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      //<-- SEE HERE
                      side:
                          BorderSide(color: CustomColor.lightGray55, width: 1),
                    ),
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl: userDataList![index].avatar!,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator()),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(userDataList![index].avatar!),
                              radius: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Flexible(
                                child: Text(
                              userDataList![index].email!,
                              style: const TextStyle(
                                  color: CustomColor.darkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Text(
                                userDataList![index].firstName!,
                                style: const TextStyle(
                                    color: CustomColor.darkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                userDataList![index].lastName!,
                                style: const TextStyle(
                                    color: CustomColor.darkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
