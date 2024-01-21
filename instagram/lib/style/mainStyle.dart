import 'package:flutter/material.dart';

var theme = ThemeData(
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 2
    )
);