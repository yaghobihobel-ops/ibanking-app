class Currency {
  final String id;
  final String code;
  final String name;
  final double rate;

  Currency({
    required this.id,
    required this.code,
    required this.name,
    required this.rate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json['id']?.toString() ?? '',
        code: json['code'] ?? '',
        name: json['name'] ?? '',
        rate: double.tryParse(json['rate'].toString()) ?? 0.0,
      );
}
