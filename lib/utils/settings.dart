import 'dart:core';
import 'package:flutter/material.dart';

String listSort;


ThemeData setDarkTheme(ThemeData themeData, bool _selection) {
  if (_selection == true) {
    themeData = ThemeData(
    brightness: Brightness.dark
    );
    return themeData;
  } else {
    themeData = ThemeData(
      brightness: Brightness.light
    );
    return themeData;
  }
}

void setListSort(String _sort) {
  listSort = _sort;
}

void setTheme() {
  
}