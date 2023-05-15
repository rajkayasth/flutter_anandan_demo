import 'package:anandan_demo_flutter/model/UserPostResponse.dart';
import 'package:anandan_demo_flutter/network_services/api_screen.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class UserPostScreen extends StatefulWidget {
  const UserPostScreen({Key? key, required this.userPostResponse})
      : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();

  final UserPostResponse userPostResponse;
}

class _UserPostScreenState extends State<UserPostScreen> {
  var userPostResponse;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getUserPostData();
  }

  void getUserPostData() async {
    /*userPostResponse = await ApiInterface().getUserPostResponse("Devanshi", "Software Enginner");*/
    userPostResponse = widget.userPostResponse;
    debugPrint("USER_POST_RESPONSE $userPostResponse");
    if (userPostResponse != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {},
        title: "Post Api Call",
        leadingIconTap: () {},
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              color: CustomColor.darkBlue,
              child: Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.fill,
              ),
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: double.maxFinite,
                  minWidth: double.maxFinite,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    border:
                        Border.all(width: 1, color: CustomColor.lightGray55),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userPostResponse?.name ?? "",
                          style: titleTextStyle16(
                              textColor: CustomColor.darkBlue,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userPostResponse?.id ?? "",
                          style: titleTextStyle16(
                              textColor: CustomColor.darkBlue,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userPostResponse?.job ?? "",
                          style: titleTextStyle16(
                              textColor: CustomColor.darkBlue,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userPostResponse?.createdAt ?? "",
                          style: titleTextStyle16(
                              textColor: CustomColor.darkBlue,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
