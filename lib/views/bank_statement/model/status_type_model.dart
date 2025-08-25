import 'package:ibanking/base/utils/basic_import.dart';

class StatusTypeModel implements DropdownModel {
  final int id;
  final String name;

  StatusTypeModel({required this.id, required this.name});

  @override
  String get title => name;
}
