import 'package:flutter/material.dart';

import '../../widgets/fav_widegt.dart';

class SettingsFavorite extends StatelessWidget {
  static const routeName = '/Favorite_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Favorites',
      )),
      body: FavoritesWidget(),
    );
  }
}
