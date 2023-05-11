import 'package:anandan_demo_flutter/model/QuotesModel.dart';
import 'package:anandan_demo_flutter/model/post_model.dart';
import 'package:anandan_demo_flutter/network_services/api_screen.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/UserModel.dart';
import '../ui_helper/custom_colors.dart';
import '../ui_helper/utils.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<PostModel>? posts;
  var isLoaded = false;

  List<Results>? resultLists;

  @override
  void initState() {
    super.initState();

    //Fetch data from API
    getData();
  }

  void getData() async {
    posts = await ApiInterface().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }



    var quotesData = await ApiInterface().getQuotes();
    resultLists = quotesData?.results;
    for(var i in resultLists!){
      print("USER_DATA ${i.content}");

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leadingIconTap: () {},onTap: () {}, title: "Quotes Screen"),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push('/userData');
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
                                color: Colors.grey),
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
                                    posts?[index].title ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: titleTextStyle20(
                                      fontWeight: FontWeight.bold,
                                      textColor: CustomColor.darkBlue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      posts?[index].body ?? "",
                                      style: titleTextStyle16(
                                          fontWeight: FontWeight.bold,
                                          textColor: CustomColor.darkGray),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
/*
*/
