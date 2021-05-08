import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_wiki/domain/theme.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_bloc/bloc.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_bloc/event.dart';
import 'package:rick_and_morty_wiki/features/settings/theme_bloc/state.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class ThemeDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateThemeDialog();
  }
}

class _StateThemeDialog extends State<ThemeDialog> {
  DarkTheme _theme = DarkTheme.disabled;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Text(
              "Dark theme",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          SizedBox(height: 12),
          _buildTile(DarkTheme.disabled, "Disabled"),
          _buildTile(DarkTheme.enabled, "Enabled"),
          _buildTile(DarkTheme.system, "Use system settings"),
          SizedBox(height: 12),
          _buildBottom(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  _buildTile(DarkTheme theme, String title) {
    return BlocBuilder<ThemeBloc, ThemeBaseState>(
      builder: (context, state) {
        if (state is! ThemeState) {
          return SizedBox.shrink();
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<DarkTheme>(
                value: theme,
                groupValue: state.theme,
                onChanged: _changeTheme,
                activeColor: AppColors.blue,
              ),
              // SizedBox(width: 16),
              Text(
                title,
                style: Theme.of(context).accentTextTheme.bodyText1,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: _goBack,
            child: Text(
              "CANCEL",
              style: Theme.of(context).primaryTextTheme.button,
            )),
        SizedBox(width: 20),
      ],
    );
  }

  _changeTheme(DarkTheme? theme) {
    if (theme != null) {
      BlocProvider.of<ThemeBloc>(context).add(SetThemeEvent(theme: theme));
    }
  }

  _goBack() {
    Navigator.pop(context);
  }
}
