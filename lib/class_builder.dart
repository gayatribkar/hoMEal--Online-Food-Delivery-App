import './screens/settings.dart';
import './screens/myCart.dart';
import './screens/home.dart';
import './screens/wallet.dart';
import './screens/favorites.dart';
import './screens/orderHistory.dart';
import './screens/coupons.dart';
import './screens/party_orders.dart';
import './screens/faqs.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<MyCart>(() => MyCart());
    register<OrderHistory>(() => OrderHistory());
    register<EnterPromoCode>(() => EnterPromoCode());
    register<Wallet>(() => Wallet());
    register<PartyOrders>(() => PartyOrders());
    register<Favorites>(() => Favorites());
    register<Settings>(() => Settings());
    register<FAQS>(() => FAQS());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
