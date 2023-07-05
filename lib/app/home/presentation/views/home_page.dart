import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itti_challenge_flutter/app/home/data/models/home_model.dart';
import 'package:itti_challenge_flutter/app/home/presentation/bloc/home_bloc.dart';
import 'package:itti_challenge_flutter/app/internal_user/presentation/views/internal_user.dart';
import 'package:itti_challenge_flutter/core/ui/colors.dart';
import 'package:itti_challenge_flutter/core/ui/constants.dart';
import 'package:itti_challenge_flutter/core/ui/enums.dart';
import 'package:itti_challenge_flutter/core/ui/snackbar.dart';
import 'package:itti_challenge_flutter/core/ui/utils.dart';
import 'package:itti_challenge_flutter/core/widgets/user_card_widget.dart';
import 'package:itti_challenge_flutter/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  goToInternalUserPage(String state, String name, String avatarUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              InternalUserPage(state: state, name: name, avatarUrl: avatarUrl)),
    );
  }

  bool isLoading = true;
  HomeModel? homeModel;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => sl<HomeBloc>()..add(const RetrieveHome())),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<HomeBloc, HomeState>(listener: (context, state) {
                if (state is LoadedHomeMethod) {
                  setState(() => isLoading = false);
                  homeModel = state.home;
                }
                if (state is ErrorHomeMethod) {
                  setState(() => isLoading = false);

                  SnackbarWidget(
                    context,
                    text: state.message,
                    type: SnackBarType.warning,
                  ).showSnackBar();
                }
              }),
            ],
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("Usuarios"),
                  backgroundColor: kMainBlueColor,
                ),
                backgroundColor: Colors.white,
                body: !isLoading
                    ? ListView(
                        children: [
                          const SizedBox(height: 20),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: homeModel!.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  int randomNumber = generateRandomNumber();
                                  print(randomNumber);
                                  if (randomNumber < 20) {
                                    goToInternalUserPage(
                                        "Activo",
                                        "${homeModel!.data[index].firstName} ${homeModel!.data[index].lastName}",
                                        homeModel!.data[index].avatar);
                                  } else if (randomNumber % 20 == 0) {
                                    goToInternalUserPage(
                                        "Inactivo",
                                        "${homeModel!.data[index].firstName} ${homeModel!.data[index].lastName}",
                                        homeModel!.data[index].avatar);
                                  } else {
                                    goToInternalUserPage(
                                        "Bloqueado",
                                        "${homeModel!.data[index].firstName} ${homeModel!.data[index].lastName}",
                                        homeModel!.data[index].avatar);
                                  }
                                },
                                child: UserCardWidget(
                                    name: homeModel!.data[index].firstName,
                                    lastName: homeModel!.data[index].lastName,
                                    avatarUrl: homeModel!.data[index].avatar,
                                    email: homeModel!.data[index].email),
                              );
                            },
                          )
                        ],
                      )
                    : Center(child: CircularProgressIndicator()))));
  }
}
