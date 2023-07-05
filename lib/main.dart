import 'package:flutter/material.dart';
import 'package:itti_challenge_flutter/app/login/presentation/views/login_page.dart';
import 'package:itti_challenge_flutter/core/ui/classes.dart';
import 'injection_container.dart' as getIt;
import 'package:get_storage/get_storage.dart';

void main() async {
  // getIt.registerSingleton<AuthBloc>(AuthBloc(login: Login(loginRepository: AuthRepository())));
  WidgetsFlutterBinding.ensureInitialized();

  await getIt.init(env: Environment.dev);
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
