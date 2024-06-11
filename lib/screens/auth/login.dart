import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../linker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode phoneNoFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();

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
            CustomWidget.text7(lan.login, fontSize: 32),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                const ForgetPassScreen().launch(
                  context,
                  pageRouteAnimation: PageRouteAnimation.Fade,
                );
              },
              child: CustomWidget.text3(lan.forgotPassword,
                  fontSize: 13, color: context.primaryColor),
            ),
          ],
        ),
        21.height,
        AppButton(
          onTap:
              formKey.currentState != null && formKey.currentState!.validate()
                  ? () {
                      formKey.currentState!.save();
                      hideKeyboard(context);
                    }
                  : null,
          text: lan.login,
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
            TextSpan(text: lan.newuser, style: secondaryTextStyle(size: 14)),
            TextSpan(
              text: lan.createaccount,
              style: primaryTextStyle(size: 14, color: context.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                      context,
                      buildPageRoute(
                          const SignupScreen(), PageRouteAnimation.Fade, null));
                },
            )
          ],
        )),
        58.height,
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
        56.height,
        AppButton(
          onTap: () {
            // appini();
            // setState(() {});
          },
          text: lan.signinasvisitor,
          elevation: 0,
          color: Colors.transparent,
          shapeBorder: RoundedRectangleBorder(
              borderRadius: radius(defaultAppButtonRadius),
              side: BorderSide(width: 1, color: context.primaryColor)),
          textColor: context.primaryColor,
          width: context.width(),
        ),
      ],
    );
  }
}

addShadow({required AppIcon child}) {
  return GestureDetector(
    onTap: () {
      showDis();
    },
    child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: child),
  );
}
