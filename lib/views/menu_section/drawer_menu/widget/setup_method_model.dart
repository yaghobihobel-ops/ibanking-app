import 'package:flutter/material.dart';

class SetupMethodModel {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  SetupMethodModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });
}
