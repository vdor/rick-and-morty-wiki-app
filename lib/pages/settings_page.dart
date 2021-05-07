import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/widgets/bottom_navigation_bar/navigation_bar.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_filter/app_bar.dart';
import 'package:rick_and_morty_wiki/widgets/settings/settings_item.dart';
import 'package:rick_and_morty_wiki/widgets/settings/theme_dialog.dart';

class SetttingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: "Settings",
        highlight: false,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: BottomNavBar(),
      body: Material(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildTitle(context, "Appearance"),
              ),
              SizedBox(height: 12),
              SettingsItem(
                title: "Dark theme",
                subtitle: "Enabled",
                image: AssetImage("assets/images/ic_appereance.png"),
                onTap: () {
                  _selectTheme(context);
                },
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    SizedBox(height: 24),
                    _buildTitle(context, "App version"),
                    SizedBox(height: 24),
                    Text(
                      "v 0.0.1",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        letterSpacing: 1.5,
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }

  _selectTheme(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ThemeDialog();
      },
    );
  }
}
