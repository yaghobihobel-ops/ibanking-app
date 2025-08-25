class ManualInputModel {
  final String? title;
  final String? subtitle;
  final List<InputField> fields;

  ManualInputModel({
    this.title,
    this.subtitle,
    required this.fields,
  });

  factory ManualInputModel.fromJson(Map<String, dynamic> json) =>
      ManualInputModel(
        title: json['title'],
        subtitle: json['subtitle'],
        fields: (json['fields'] as List)
            .map((e) => InputField.fromJson(e))
            .toList(),
      );
}

class InputField {
  final String type;
  final String name;
  final String? label;
  final String? placeholder;
  final bool? isRequired;

  InputField({
    required this.type,
    required this.name,
    this.label,
    this.placeholder,
    this.isRequired,
  });

  factory InputField.fromJson(Map<String, dynamic> json) => InputField(
        type: json['type'] ?? 'text',
        name: json['name'],
        label: json['label'],
        placeholder: json['placeholder'],
        isRequired: json['is_required'] ?? false,
      );
}
