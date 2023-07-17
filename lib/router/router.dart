import 'package:auto_route/auto_route.dart';

import '../features/home/view/home_screen.dart';
import '../features/settings/view/settings_screen.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: SettingsRoute.page),
      ];
}
