import 'package:flutter/material.dart';

import '../../widgets/settings-screen-widgets/help_widget.dart';

class SettingsHelp extends StatelessWidget {
  static const routeName = '/Help_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Help',
      )),
      body: SettingsHelpWidget(),
    );
  }
}
