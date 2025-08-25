
part of 'beneficiary_screen.dart';
class BeneficiaryTabletScreen extends GetView<BeneficiaryController> {
  const BeneficiaryTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Beneficiary Tablet Screen'),
      body: _bodyWidget(context),
    );
  }
  _bodyWidget(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [],
      ),
    );
  }
}

