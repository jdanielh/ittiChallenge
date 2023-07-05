import 'package:flutter/material.dart';
import 'package:itti_challenge_flutter/core/ui/colors.dart';

class InternalUserPage extends StatelessWidget {
  final String state;
  final String avatarUrl;
  final String name;
  const InternalUserPage(
      {super.key,
      required this.state,
      required this.avatarUrl,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: const Text('Perfil'),
          backgroundColor: kMainBlueColor,
        ),
        body: SizedBox(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(color: kMainBlueColor),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(avatarUrl),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Cliente $state",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ));
  }
}
