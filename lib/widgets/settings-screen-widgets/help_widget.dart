import 'package:flutter/material.dart';

class SettingsHelpWidget extends StatelessWidget {
  SettingsHelpWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.065,
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'Recent Order',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: double.infinity,
              color: Colors.grey[300],
              child: Text(
                'Help in other queries',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'General issues',
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Color(0xff00001a),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/General_page');
                    }),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.black45,
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Legal terms and Conditions',
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Color(0xff00001a),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Legal_page');
                    }),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.black45,
            ),
            Container(
              child: ListTile(
                title: Text(
                  'FAQs',
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Color(0xff00001a),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Faq_page');
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
