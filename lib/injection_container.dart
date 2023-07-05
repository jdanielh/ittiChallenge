import 'package:get_it/get_it.dart';

import 'app/login/injection.dart' as login;
import 'app/home/injection.dart' as home;

GetIt sl = GetIt.instance;

Future<void> init({required String env}) async {
  login.init(env);
  home.init(env);
}
