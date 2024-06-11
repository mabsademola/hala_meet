import 'package:flutter/material.dart';

abstract class BaseLanguage {
  static BaseLanguage of(BuildContext context) =>
      Localizations.of<BaseLanguage>(context, BaseLanguage)!;

  String get walkTitle1;
  String get walkTitle2;
  String get walkTitle3;
  String get walkThrough1;
  String get walkThrough2;
  String get walkThrough3;
  String get next;
  String get login;
  String get signinasvisitor;
  String get phonenumber;
  String get password;
  String get forgotPassword;
  String get newuser;
  String get createaccount;
  String get conwith;
  String get tNc;
  String get tNc1;
  String get q1;
  String get q2;
  String get q3;
  String get q4;
  String get q5;
  String get q6;
  String get q7;
  String get send;
  // String get q6;
}
