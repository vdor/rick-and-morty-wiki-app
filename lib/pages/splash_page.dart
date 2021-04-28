import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rick_and_morty_wiki/pages/splash_page_desktop.dart';
import 'package:rick_and_morty_wiki/pages/splash_page_mobile.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SplashPageMobile(),
      tablet: SplashPageDesktop(),
      desktop: SplashPageDesktop(),
    );
  }
}
