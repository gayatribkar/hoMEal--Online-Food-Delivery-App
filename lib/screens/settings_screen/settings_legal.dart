import 'package:flutter/material.dart';

import '../../widgets/faq_widget.dart';
import '../../provider/legal_terms_data.dart';

class SettingsLegal extends StatelessWidget {
  static const routeName = '/Legal_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Legal Terms and Conditions',
      )),
      body: FaqWidget(legalTerms),
    );
  }
}
