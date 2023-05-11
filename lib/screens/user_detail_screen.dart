import 'package:anandan_demo_flutter/model/UserImageModel.dart';
import 'package:anandan_demo_flutter/network_services/api_screen.dart';
import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  List<UserImageModel>? userImageList;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    userImageList = await ApiInterface().getUserImageData();
    if(userImageList != null){
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
        title: "API CALL USING DIO",
        leadingIconTap: () {},
      ),
      body: SafeArea(
        child: Visibility(
          visible: isLoaded,
          replacement:  const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: userImageList?.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //<-- SEE HERE
                  side: BorderSide(color: CustomColor.lightGray55, width: 1),
                ),
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.maxFinite,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                        child: CachedNetworkImage(imageUrl: userImageList![index].url!,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),),
                      ),

                      /*Image.network(
                        userImageList![index].url!,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          print(stackTrace);
                          return Container(color: CustomColor.darkGray,);
                        },
                      ),*/
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children:  [
                        const SizedBox(height: 10,width: 10,),
                        CircleAvatar(backgroundImage: NetworkImage(userImageList![index].thumbnailUrl!),radius: 30,),
                        const SizedBox(width: 15,),
                         Flexible(child: Text(userImageList![index].title!,style: const TextStyle(color: CustomColor.darkBlue,fontWeight: FontWeight.bold,fontSize: 20),)),
                        const SizedBox(width: 5,),
                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
