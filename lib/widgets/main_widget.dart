import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';

import '../screens/Login/sigin_page.dart';
import '../icons/balloons_icons.dart';
import '../screens/party_orders.dart';
import '../provider/user_data.dart';
import '../screens/favorites.dart';
import '../screens/settings.dart';
import '../screens/coupons.dart';
import '../screens/wallet.dart';
import '../screens/myCart.dart';
import '../class_builder.dart';
import '../screens/home.dart';
import '../screens/faqs.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  static const routeName = '/MainWidget';
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text:
              Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'My Cart',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
          page: MyCart(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Order History',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.event_note_rounded, color: Colors.white),
          page: ClassBuilder.fromString('OrderHistory'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Coupons',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.wallet_giftcard_rounded, color: Colors.white),
          page: EnterPromoCode(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Wallet',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.account_balance_wallet_rounded, color: Colors.white),
          page: Wallet(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Favorites',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.star, color: Colors.white),
          page: Favorites(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Party Orders',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Balloons.balloons_removebg_preview, color: Colors.white),
          page: PartyOrders(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'FAQs',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.question_answer_rounded, color: Colors.white),
          page: FAQS(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final userHolderData = Provider.of<UserDataFinal>(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final userFirstName = userHolderData.getSingleUserData(id);
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage('images/user.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      'Hello!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    new SizedBox(height: 2),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01),
                        child: new Text(
                          userFirstName.firstName,
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.lightBlueAccent[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          icon: Icon(
            Icons.logout,
            color: Colors.grey,
          ),
          text: Text(
            'Logout',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(SignInPage.routeName);
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff00001a).withOpacity(0.75),
              Color(0xff00001a).withOpacity(0.75),
              // Color(0xff00001a),
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
