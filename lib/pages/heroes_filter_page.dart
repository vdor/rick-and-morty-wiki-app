import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/domain/heroes_filter.dart';
import 'package:rick_and_morty_wiki/theme.dart';
import 'package:rick_and_morty_wiki/widgets/heroes_filter/app_bar.dart';
import 'package:rick_and_morty_wiki/widgets/divider.dart' as divider;
import 'package:rick_and_morty_wiki/widgets/heroes_filter/filter_item.dart';

class HeroesFilterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHeroesFilterPage();
  }
}

class _StateHeroesFilterPage extends State {
  HeroesOrder? orderBy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeroesFilterAppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Material(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 24, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle("SORT BY"),
              SizedBox(height: 24),
              _buildSortSection(),
              divider.Divider(),
              SizedBox(height: 36),
              _buildTitle("FILTER BY:"),
              SizedBox(height: 36),
            ],
          ),
        ),
        FilterItem(title: "C-113", hint: "Location", onTap: () {}),
        FilterItem(title: "Earth", hint: "Origin", onTap: () {}),
      ],
    );
  }

  Widget _buildSortSection() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text("By alphabet")),
            IconButton(
              onPressed: _setOrderDesc,
              splashRadius: 20,
              icon: Image.asset(
                "assets/images/ic_sort_desc.png",
                color: orderBy == HeroesOrder.desc
                    ? AppColors.blue
                    : Theme.of(context).iconTheme.color,
              ),
            ),
            SizedBox(width: 30),
            IconButton(
              onPressed: _setOrderAsc,
              splashRadius: 20,
              icon: Image.asset(
                "assets/images/ic_sort_asc.png",
                color: orderBy == HeroesOrder.asc
                    ? AppColors.blue
                    : Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
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

  _setOrderAsc() {
    setState(() {
      orderBy = orderBy == HeroesOrder.asc ? null : HeroesOrder.asc;
    });
  }

  _setOrderDesc() {
    setState(() {
      orderBy = orderBy == HeroesOrder.desc ? null : HeroesOrder.desc;
    });
  }
}
