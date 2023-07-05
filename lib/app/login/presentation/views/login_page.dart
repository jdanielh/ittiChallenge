import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itti_challenge_flutter/app/home/presentation/views/home_page.dart';
import 'package:itti_challenge_flutter/app/login/data/models/user_request_model.dart';
import 'package:itti_challenge_flutter/app/login/presentation/bloc/auth_bloc.dart';
import 'package:itti_challenge_flutter/core/ui/colors.dart';
import 'package:itti_challenge_flutter/core/ui/enums.dart';
import 'package:itti_challenge_flutter/core/ui/snackbar.dart';
import 'package:itti_challenge_flutter/core/widgets/form_button_widget.dart';
import 'package:itti_challenge_flutter/injection_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String login = '';
  String password = '';
  String message = '';
  bool isLoading = false;
  showTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
          onChanged: (val) {
            if (label == "Contraseña") {
              password = val;
            } else {
              login = val;
            }
          },
          inputFormatters: label == "Contraseña"
              ? []
              : [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'\d')), // Ignorar dígitos numéricos
                ],
          keyboardType:
              label == "Contraseña" ? TextInputType.number : TextInputType.text,
          obscureText: label == "Contraseña",
          maxLength: label == "Contraseña" ? 5 : null,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              label: Text(label),
              alignLabelWithHint: true,
              labelStyle: const TextStyle(color: Colors.white),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoadingLogintMethod) {
              setState(() => isLoading = true);
            }

            if (state is LoadedLoginMethod) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }

            if (state is ErrorLoginMethod) {
              setState(() => isLoading = false);
              SnackbarWidget(
                context,
                text: state.message,
                type: SnackBarType.warning,
              ).showSnackBar();
            }
          },
          child: Scaffold(
            body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/ic_bg.png"),
                    fit: BoxFit.cover),
              ),
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.18),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.height * 0.03),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // color: Colors.green,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Column(
                                          children: [
                                            showTextField("Usuario"),
                                            showTextField("Contraseña"),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      BlocBuilder<AuthBloc, AuthState>(
                                        builder: (context, state) {
                                          return FormButtonWidget(
                                            clr: kMainPurpleColor,
                                            lbl: "INGRESAR",
                                            onPressFunction: () async {
                                              if ((login != null &&
                                                      login!.isNotEmpty) &&
                                                  (password != null &&
                                                      password!.isNotEmpty)) {
                                                context.read<AuthBloc>().add(
                                                    RetrieveLoginSubmittedMethod(
                                                        userBodyRequestModel:
                                                            UserRequestModel(
                                                                login:
                                                                    login ?? '',
                                                                pass:
                                                                    password ??
                                                                        '')));
                                              } else {
                                                // print("hola2");
                                                SnackbarWidget(
                                                  context,
                                                  text:
                                                      "Todos los campos son obligatorios",
                                                  type: SnackBarType.warning,
                                                ).showSnackBar();
                                                setState(() => message =
                                                    state.errorMessage);
                                                Future.delayed(
                                                    const Duration(seconds: 3),
                                                    () => setState(
                                                        () => message = ""));
                                              }
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
