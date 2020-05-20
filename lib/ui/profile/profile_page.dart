import 'package:flutter/material.dart';
import 'package:flutter_eyes/provider/app_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            '夜间模式',
          ),
          onTap: () {
            final provider = Provider.of<AppProvider>(context, listen: false);
            provider.changeTheme(!provider.isDark);
          },
        )
      ],
    ));
  }
}
