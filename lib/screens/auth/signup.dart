import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../linker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode nameFocus = FocusNode();
  FocusNode phoneNoFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    nameController.addListener(_onTextChange);
    phoneNoController.addListener(_onTextChange);
    passwordController.addListener(_onTextChange);
  }

  void _onTextChange() {
    // log('value');
    setState(() {});
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(context).backAndTitleOnly(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomWidget.text7(lan.q3, fontSize: 32),
            38.height,
            Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: _inputLoginSection(context)),
            29.height,
            _otherSection()
          ],
        ),
      ),
    );
  }

  Column _inputLoginSection(BuildContext context) {
    return Column(
      children: [
        CustomWidget().textFieldandTitle(context,
            controller: nameController,
            textFieldType: TextFieldType.NAME,
            focus: nameFocus,
            nextFocus: phoneNoFocus,
            title: lan.q4,
            prefixIcon: AppIcons.person,
            hint: 'Mabs Ademola'),
        CustomWidget().textFieldandTitle(context,
            controller: phoneNoController,
            textFieldType: TextFieldType.PHONE,
            focus: phoneNoFocus,
            nextFocus: passwordFocus,
            title: lan.phonenumber,
            prefixIcon: AppIcons.call,
            hint: '00000000000'),
        CustomWidget().textFieldandTitle(
          context,
          controller: passwordController,
          focus: passwordFocus,
          textFieldType: TextFieldType.PASSWORD,
          title: lan.password,
          onFieldSubmitted: (_) => hideKeyboard(context),
          prefixIcon: AppIcons.passlock,
          hint: '**********',
        ),
        Row(
          children: [
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: '*',
                    style: secondaryTextStyle(
                        size: 10, color: context.primaryColor)),
                TextSpan(text: lan.q1, style: secondaryTextStyle(size: 10)),
                TextSpan(
                  text: lan.q2,
                  style:
                      primaryTextStyle(size: 10, color: context.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      const TnC().launch(context);
                    },
                )
              ],
            )),
          ],
        ),
        35.height,
        AppButton(
          onTap:
              formKey.currentState != null && formKey.currentState!.validate()
                  ? () {
                      formKey.currentState!.save();
                      hideKeyboard(context);
                    }
                  : null,
          text: lan.q3,
          disabledColor: Colors.grey,
          width: context.width(),
        ),
      ],
    );
  }

  Column _otherSection() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Row(),
        RichText(
            text: TextSpan(
          children: [
            TextSpan(text: lan.q5, style: secondaryTextStyle(size: 14)),
            TextSpan(
              text: lan.login,
              style: primaryTextStyle(size: 14, color: context.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                    context,
                    buildPageRoute(
                        const LoginScreen(), PageRouteAnimation.Fade, null),
                  );
                },
            )
          ],
        )),
        38.height,
        Text(lan.conwith, style: secondaryTextStyle(size: 14)),
        19.height,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            addShadow(
              child: const AppIcon(
                AppIcons.x,
                size: 50,
              ),
            ),
            12.width,
            addShadow(
              child: const AppIcon(
                AppIcons.facebook,
                size: 50,
              ),
            ),
            12.width,
            addShadow(
              child: const AppIcon(
                AppIcons.google,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
