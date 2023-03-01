import 'package:dio/dio.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/home/home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: HomeView,
      initial: true,
    ),
  ],
  dependencies: [
    LazySingleton(classType: Dio),
  ],
  locatorName: 'locator',
  locatorSetupName: 'setupLocator',
)
class App {
  /** This class has no purpose besides housing the annotation that generates the required functionality **/
}