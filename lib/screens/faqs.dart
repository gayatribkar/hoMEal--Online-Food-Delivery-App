import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../widgets/faq_widget.dart';
import '../provider/faqs_data.dart';

// ignore: must_be_immutable
class FAQS extends KFDrawerContent {
  static const routename = "/faq-page";

  FAQS({
    Key key,
  });

  @override
  _FAQSState createState() => _FAQSState();
}

class _FAQSState extends State<FAQS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'FAQs',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: FaqWidget(faqQuestions),
            ),
          ],
        ),
      ),
    );
  }
}
