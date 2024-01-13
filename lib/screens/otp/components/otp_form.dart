import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/complete_profile/complete_profile_screen.dart';
import 'package:hapind/service/otp_service.dart';
import 'package:hapind/size_config.dart';
import 'package:quickalert/quickalert.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  final UserRegister user;

  const OtpForm({Key? key, required this.user}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState(user: user);
}

class _OtpFormState extends State<OtpForm> {
  OtpService _otpService = OtpService();
  //String inputOTP = "";
  Future<String?>? validateOTP;
  DateTime generatedTime = DateTime(0);
  Duration validityDuration = Duration();
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  final UserRegister user;
  _OtpFormState({required this.user});

  @override
  void initState()  {
    print(user.toMap());
    super.initState();
    generatedTime = DateTime.now();
    validityDuration = Duration(seconds: 60);
    validateOTP =  _otpService.generateOtp(user.email);
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    print(validateOTP);
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
      print("input " + value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: otpController1,
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: otpController2,
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: otpController3,
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                    controller: otpController4,
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FocusNode!.unfocus();
                      }
                    },
                    validator: (String? value) {
                      if (value!.isEmpty || value == null) {
                        //  addError(error: kPassNullError);
                        return "Please Enter your OTP";
                      }
                      return null;
                    }),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async {
              String inputOTP = otpController1.text +
                  otpController2.text +
                  otpController3.text +
                  otpController4.text;
                  
              bool isValidOtp = await _otpService.validateOtp(Future.value(inputOTP), validateOTP);
              bool isExpired =
                  _otpService.isOtpExpired(generatedTime, validityDuration);
              print("inputOTP is :" + inputOTP);
              //print("validateOTP is :" + validateOTP);
              if (isValidOtp && !isExpired) {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteProfileScreen(user: user),
                        ));
                //Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              } else if (isExpired) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  text: "OTP is Expired",
                  confirmBtnText: 'OK',
                  confirmBtnColor: Colors.redAccent,
                  onConfirmBtnTap: () {
                    Navigator.pop(context); // Dismiss the alert
                  },
                );
              } else if (!isValidOtp) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  text: "OTP is not Match",
                  confirmBtnText: 'OK',
                  confirmBtnColor: Colors.redAccent,
                  onConfirmBtnTap: () {
                    Navigator.pop(context); // Dismiss the alert
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
