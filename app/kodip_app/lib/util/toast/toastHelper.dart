
import 'package:flutter/material.dart';
import 'package:sampl/util/design/textClass.dart';

void showToast(BuildContext context, {
  required final String msg
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextSmall(text: msg)));
}