import 'package:anandan_demo_flutter/model/UserPostResponse.dart';
import 'package:anandan_demo_flutter/screens/add_learner_screen.dart';
import 'package:anandan_demo_flutter/screens/image_screen.dart';
import 'package:anandan_demo_flutter/screens/learner_details.dart';
import 'package:anandan_demo_flutter/screens/lerner_list_page.dart';
import 'package:anandan_demo_flutter/screens/login_screen.dart';
import 'package:anandan_demo_flutter/screens/qoutes_screen.dart';
import 'package:anandan_demo_flutter/screens/singup_screen.dart';
import 'package:anandan_demo_flutter/screens/splash_screen.dart';
import 'package:anandan_demo_flutter/screens/user_detail_screen.dart';
import 'package:anandan_demo_flutter/screens/user_list_screen.dart';
import 'package:anandan_demo_flutter/screens/user_post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'model/learner_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(routes: <GoRoute>[
      GoRoute(routes:  <GoRoute>[
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: 'signUp',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: 'learnerList',
          builder: (context, state) =>  LearnersPage(
            learnerModel: state.extra as LearnerModel?,
          ),
        ),
        GoRoute(
          path: 'learnerDetail',
          name: 'learnerDetails',
          builder: (context, state) =>  LearnerDetails(learnerModel: state.extra as LearnerModel,),
        ),
        GoRoute(
          path: 'addLearner',
          name: 'addLearner',
          builder: (context, state) =>  const AddLearnerPage(),
        ),
        GoRoute(
          path: 'quote',
          name: 'quotePage',
          builder: (context, state) =>  const QuoteScreen(),
        ),
        GoRoute(
          path: 'userData',
          name: 'userDataScreen',
          builder: (context, state) =>  const UserScreen(),
        ),
        GoRoute(
          path: 'userDetailsScreen',
          name: 'userDetailsScreen',
          builder: (context, state) =>  const UserDetailsScreen(),
        ),
        GoRoute(
          path: 'selectImage',
          name: 'selectImage',
          builder: (context, state) =>  const SelectImageScreen(),
        ),
        GoRoute(
          path: 'userPostScreen',
          name: 'userPostScreen',
          builder: (context, state) =>   UserPostScreen(userPostResponse: state.extra as UserPostResponse,),
        ),
      ], path: '/',
        builder: (context, state) => const SplashScreen(),)
    ]);


    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
      /*routerDelegate: _router.routerDelegate,
      routeInformationParser:_router.routeInformationParser,
      routeInformationProvider:_router.routeInformationProvider,*/
    );
  }
}

