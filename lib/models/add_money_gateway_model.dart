class AddMoneyGatewayModel {
  final String id;
  final String name;
  final String? imageUrl;
  final String? currencyId;

  AddMoneyGatewayModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.currencyId,
  });

  factory AddMoneyGatewayModel.fromJson(Map<String, dynamic> json) =>
      AddMoneyGatewayModel(
        id: json['id']?.toString() ?? '',
        name: json['name'] ?? '',
        imageUrl: json['image_url'],
        currencyId: json['currency_id']?.toString(),
      );
}
