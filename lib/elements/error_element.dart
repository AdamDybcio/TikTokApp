import 'package:flutter/material.dart';

Widget buildErrorWidget(String error) {
  return Column(
    children: const [
      Text(
        'Error',
        style: TextStyle(
          color: Colors.white,
        ),
      )
    ],
  );
}
