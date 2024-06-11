import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../linker.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode phoneNoFocus = FocusNode();
  FocusNode nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    phoneNoController.addListener(_onTextChange);
    nameController.addListener(_onTextChange);
  }

  void _onTextChange() {
    // log('value');
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(context).backAndTitleOnly(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomWidget.text7(lan.q6, fontSize: 32),
            38.height,
            Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: _inputForPasswordSection(context)),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  onTap: formKey.currentState != null &&
                          formKey.currentState!.validate()
                      ? () {
                          formKey.currentState!.save();
                          hideKeyboard(context);
                          CustomDialog.showLoading(
                              "Sending OTP, please wait...",
                              'Check your message for received OTP');

                          const OTPScreen().launch(context,
                              pageRouteAnimation: PageRouteAnimation.Fade);
                        }
                      : null,
                  text: lan.send,
                  disabledColor: Colors.grey,
                  width: context.width(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _inputForPasswordSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
            nextFocus: nameFocus,
            title: lan.phonenumber,
            prefixIcon: AppIcons.call,
            hint: '00000000000'),
        Row(
          children: [
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: '*',
                    style: secondaryTextStyle(
                        size: 10, color: context.primaryColor)),
                TextSpan(
                  text: lan.q7,
                  style: secondaryTextStyle(size: 10),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      const TnC().launch(context);
                    },
                )
              ],
            )),
          ],
        ),
      ],
    );
  }
}
