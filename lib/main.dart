import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/settings_screen/settings_payment.dart';
import './screens/settings_screen/settings_general.dart';
import './screens/settings_screen/settings_legal.dart';
import './screens/settings_screen/settings_offer.dart';
import './screens/settings_screen/settings_help.dart';
import './screens/settings_screen/settings_fav.dart';
import './screens/settings_screen/settings_faq.dart';
import './screens/orderHistory.dart';
import './screens/party_orders.dart';
import './screens/favorites.dart';
import './screens/settings.dart';
import './screens/coupons.dart';
import './screens/myCart.dart';
import './screens/wallet.dart';
import './screens/home.dart';
import './screens/faqs.dart';
import './screens/Login/register_page.dart';
import './screens/Login/first_page.dart';
import './screens/Login/sigin_page.dart';
import './widgets/party-screen-widgets/partyCart_page.dart';
import './widgets/home_Sub_Categories.dart';
import './widgets/payment_gateway.dart';
import './widgets/final_payment.dart';
import './widgets/main_widget.dart';
import './provider/order_history_data.dart';
import './provider/partyOrders_data.dart';
import './provider/meal_data.dart';
import './provider/user_data.dart';
import './provider/partyorder_history_data.dart';
import './class_builder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MealData(),
        ),
        ChangeNotifierProvider.value(
          value: UserDataFinal(),
        ),
        ChangeNotifierProvider.value(
          value: OrderHistoryData(),
        ),
        ChangeNotifierProvider.value(
          value: PartyOrderHistoryData(),
        ),
        ChangeNotifierProvider.value(
          value: PartyOrderData(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: MaterialColor(Color(0xff00001a).value, {
            50: Color(0xffe5e5ff),
            100: Color(0xffb3b3ff),
            200: Color(0xff8080ff),
            300: Color(0xff4d4dff),
            400: Color(0xff1a1aff),
            500: Color(0xff0000e6),
            600: Color(0xff0000b3),
            700: Color(0xff000080),
            800: Color(0xff00004d),
            900: Color(0xff00001a),
          }),
          fontFamily: 'Andika',
        ),
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
        routes: {
          '/category-meals': (ctx) => HomeSubCategories(),
          EnterPromoCode.routename: (ctx) => EnterPromoCode(),
          FAQS.routename: (ctx) => FAQS(),
          Favorites.routename: (ctx) => Favorites(),
          Home.routename: (ctx) => Home(),
          MyCart.routename: (ctx) => MyCart(),
          OrderHistory.routename: (ctx) => OrderHistory(),
          Settings.routename: (ctx) => Settings(),
          PartyOrders.routename: (ctx) => PartyOrders(),
          Wallet.routename: (ctx) => Wallet(),
          FinalPayment.routeName: (ctx) => FinalPayment(),
          PaymentGateway.routeName: (ctx) => PaymentGateway(),
          MainWidget.routeName: (ctx) => MainWidget(),
          RegisterPage.routeName: (ctx) => RegisterPage(),
          SignInPage.routeName: (ctx) => SignInPage(),
          SettingsFavorite.routeName: (ctx) => SettingsFavorite(),
          SettingsPay.routeName: (ctx) => SettingsPay(),
          SettingsHelp.routeName: (ctx) => SettingsHelp(),
          SettingsFaq.routeName: (ctx) => SettingsFaq(),
          GeneralFaq.routeName: (ctx) => GeneralFaq(),
          SettingsLegal.routeName: (ctx) => SettingsLegal(),
          SettingsOffers.routeName: (ctx) => SettingsOffers(),
        },
      ),
    );
  }
}
