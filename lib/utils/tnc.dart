import 'package:flutter/material.dart';

import '../linker.dart';

class TnC extends StatelessWidget {
  const TnC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(context).backAndTitleOnly(title: lan.tNc1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomWidget.text4(lan.tNc, fontSize: 19),
          ],
        ),
      ),
    );
  }
}
