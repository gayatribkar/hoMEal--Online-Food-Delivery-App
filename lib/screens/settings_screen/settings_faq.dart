import 'package:flutter/material.dart';

import '../../widgets/faq_widget.dart';
import '../../provider/faqs_data.dart';

class SettingsFaq extends StatelessWidget {
  static const routeName = '/Faq_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'FAQs',
      )),
      body: FaqWidget(faqQuestions),
    );
  }
}
