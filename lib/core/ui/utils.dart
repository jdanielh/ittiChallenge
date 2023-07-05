import 'dart:math';

import 'package:flutter/material.dart';
import 'package:itti_challenge_flutter/core/ui/colors.dart';

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(100) + 1;
}
