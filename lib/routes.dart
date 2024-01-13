import 'package:flutter/widgets.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/accounts/Edit_account.dart';
import 'package:hapind/screens/cart/cart_screen.dart';
import 'package:hapind/screens/chat/chats_screen.dart';
import 'package:hapind/screens/complete_profile/complete_profile_screen.dart';
import 'package:hapind/screens/details/details_screen.dart';
import 'package:hapind/screens/distance/distance_screen.dart';
import 'package:hapind/screens/finding/finding_screen.dart';
import 'package:hapind/screens/forgot_password/forgot_password_screen.dart';
import 'package:hapind/screens/gender/gender_screen.dart';
import 'package:hapind/screens/geo/geolocator_map.dart';
import 'package:hapind/screens/geo/geolocator_widget.dart';
import 'package:hapind/screens/home/home_screen.dart';
//import 'package:hapind/screens/login_fail/login_fail_screen.dart';
import 'package:hapind/screens/login_success/login_success_screen.dart';
// ignore: unused_import
import 'package:hapind/screens/messages/components/message.dart';
import 'package:hapind/screens/messages/message_screen.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/screens/profile/profile_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/register_success/register_success_screen.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';
import 'package:hapind/screens/smoking/smoking_screen.dart';
import 'package:hapind/screens/splash/splash_screen.dart';
import 'package:hapind/screens/status/status_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),

  // test case, need to delte after test
  MapsDemo.routeName:(context)=> MapsDemo(),
  // test case, need to delte after test

  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  RegisterSuccessScreen.routeName: (context) => RegisterSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  //OtpScreen.routeName: (context) => OtpScreen(),
  OtpScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return OtpScreen(user: user);
  },
  CompleteProfileScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteProfileScreen(user: user);
  },
  //CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  //CompleteGenderScreen.routeName: (context) => CompleteGenderScreen(),
  CompleteGenderScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteGenderScreen(user: user);
  },
  //CompletePurposeScreen.routeName: (context) => CompletePurposeScreen(),
  CompletePurposeScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompletePurposeScreen(user: user);
  },
  //CompleteFindingScreen.routeName: (context) => CompleteFindingScreen(),
  CompleteFindingScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteFindingScreen(user: user);
  },
  //CompleteDistanceScreen.routeName: (context) => CompleteDistanceScreen(),
  CompleteDistanceScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteDistanceScreen(user: user);
  },
  //CompleteStatusScreen.routeName:(context) => CompleteStatusScreen(),
  //CompleteSmokingScreen.routeName:(context) => CompleteSmokingScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MyAccount.routeName: (context) => MyAccount(folderName: ""),
  ChatsScreen.routeName: (context) => ChatsScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
};
