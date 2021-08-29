import 'package:flutter/material.dart';

import '../../widgets/coupons_widget.dart';

class SettingsOffers extends StatelessWidget {
  static const routeName = '/Offers_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Coupons',
      )),
      body: CouponsWidget(),
    );
  }
}
