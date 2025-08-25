
part of 'add_beneficiary_screen.dart';
class AddBeneficiaryTabletScreen extends GetView<AddBeneficiaryController> {
  const AddBeneficiaryTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('AddBeneficiary Tablet Screen'),
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

