import 'package:dataflows_assessment/app/assets/assets.g.dart';
import 'package:dataflows_assessment/app/assets/router/app_router.dart';
import 'package:dataflows_assessment/generated/l10n.dart';

enum TabBarEnum {
  home,
  mall,
  discover,
  inbox,
  account;

  String get tapName {
    switch (this) {
      case TabBarEnum.home:
        return S.current.home;
      case TabBarEnum.mall:
        return S.current.mall;
      case TabBarEnum.discover:
        return S.current.discover;
      case TabBarEnum.inbox:
        return S.current.inbox;
      case TabBarEnum.account:
        return S.current.account;
    }
  }

  String get icon {
    switch (this) {
      case TabBarEnum.home:
        return Assets.icHome.path;
      case TabBarEnum.mall:
        return Assets.icMall.path;
      case TabBarEnum.discover:
        return Assets.icDiscover.path;
      case TabBarEnum.inbox:
        return Assets.icInbox.path;
      case TabBarEnum.account:
        return Assets.icAccount.path;
    }
  }

  String get activeIcon {
    switch (this) {
      case TabBarEnum.home:
        return Assets.icHomeActive.path;
      case TabBarEnum.mall:
        return Assets.icMallActive.path;
      case TabBarEnum.discover:
        return Assets.icDiscover.path;
      case TabBarEnum.inbox:
        return Assets.icInbox.path;
      case TabBarEnum.account:
        return Assets.icAccount.path;
    }
  }

  String get path {
    switch (this) {
      case TabBarEnum.home:
        return RouterPath.home;
      case TabBarEnum.mall:
        return RouterPath.mall;
      case TabBarEnum.discover:
        return RouterPath.discover;
      case TabBarEnum.inbox:
        return RouterPath.inbox;
      case TabBarEnum.account:
        return RouterPath.account;
    }
  }
}
