import 'package:flutter/material.dart';

import '../../widgets/faq_widget.dart';
import '../../provider/general_faq_data.dart';

//import 'package:flutter_smart_home_ui/widgets/fav_widget.dart';
class GeneralFaq extends StatelessWidget {
  static const routeName = '/General_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'General FAQs',
      )),
      body: FaqWidget(generalQuestions),
    );
  }
}
