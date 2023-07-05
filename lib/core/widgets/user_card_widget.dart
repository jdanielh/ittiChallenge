import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itti_challenge_flutter/core/ui/enums.dart';
import 'package:itti_challenge_flutter/core/ui/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class UserCardWidget extends StatelessWidget {
  final String name;
  final String lastName;
  final String avatarUrl;
  final String email;
  const UserCardWidget(
      {required this.name,
      required this.lastName,
      required this.avatarUrl,
      required this.email,
      super.key});

  @override
  Widget build(BuildContext context) {
    void _launchSendEMail(String mail) async {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
      }

// ···
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'smith@example.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Example Subject & Symbols are allowed!',
        }),
      );

      if (await launchUrl(emailLaunchUri)) {
        //email app opened
      } else {
        SnackbarWidget(
          context,
          text: "Ocurrio un error inesperado al intentar abrir el email",
          type: SnackBarType.error,
        ).showSnackBar();
      }
    }

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$name $lastName"),
                  GestureDetector(
                      onTap: () async {
                        _launchSendEMail(email);
                      },
                      child: Text(
                        email,
                        style: TextStyle(fontSize: 19),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
