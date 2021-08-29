import 'package:flutter/material.dart';

import '../../widgets/settings-screen-widgets/settings_payment.dart';

class SettingsPay extends StatelessWidget {
  static const routeName = '/Payment_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
        ),
      ),
      body: SettingsPayment(),
    );
  }
}
