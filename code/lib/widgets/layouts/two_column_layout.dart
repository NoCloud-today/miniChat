import 'package:fluffychat/config/app_config.dart';
import 'package:fluffychat/config/app_config.dart';
import 'package:fluffychat/config/app_config.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fluffychat/config/themes.dart';

class TwoColumnLayout extends StatelessWidget {
  final Widget mainView;
  final Widget sideView;
  final bool displayNavigationRail;

  const TwoColumnLayout({
    super.key,
    required this.mainView,
    required this.sideView,
    required this.displayNavigationRail,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldMessenger(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              width: FluffyThemes.columnWidth +
                  (displayNavigationRail ? FluffyThemes.navRailWidth : 0),
              child: Column(
                children: [
                  Visibility(
                    visible: true,
                    maintainState: true,
                    child: Text(AppConfig.applicationName + ".",
                        textDirection: TextDirection.ltr,
                        style: theme.textTheme.titleLarge),
                  ),
                  Expanded(child: mainView),
                ],
              ),
            ),
            Container(
              width: 1.0,
              color: theme.dividerColor,
            ),
            Expanded(
              child: ClipRRect(
                child: sideView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
