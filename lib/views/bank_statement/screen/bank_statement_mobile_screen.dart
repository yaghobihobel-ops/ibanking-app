part of 'bank_statement_screen.dart';

class BankStatementMobileScreen extends GetView<BankStatementController> {
  const BankStatementMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.bankStatement),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: mainMin,
            children: [
              _inputWidget(context),
              _filterButtonWidget(),
              _transactionResultWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Sizes.height.betweenInputBox,
        TextWidget(
          Strings.filterByDate,
          style: CustomStyle.labelSmall.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Sizes.height.btnInputTitleAndBox,
        InkWell(
          onTap: () {
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime.now().subtract(const Duration(days: 30)),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              endDate: controller.endDate.value,
              startDate: controller.startDate.value,
              backgroundColor: Colors.white,
              primaryColor: Colors.green,
              onApplyClick: (start, end) {
                controller.endDate.value = end;
                controller.startDate.value = start;
                controller.selectDate.value =
                    '${start.year}-${start.month}-${start.day} To ${end.year}-${end.month}-${end.day}';
              },
              onCancelClick: () {
                controller.endDate.value = null;
                controller.startDate.value = null;
                controller.selectDate.value = Strings.selectDate;
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              border: Border.all(
                color: Color(0xffE0E0E0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize,
              vertical: Dimensions.verticalSize * 0.55,
            ),
            child: Row(
              children: [
                TextWidget(
                  controller.selectDate.value,
                  typographyStyle: TypographyStyle.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        Sizes.height.betweenInputBox,
        PrimaryInputWidget(
          controller: controller.trxIdController,
          hintText: Strings.trxId,
          label: Strings.filterByTrx,
        ),
        Sizes.height.betweenInputBox,
        TextWidget(
          Strings.filterByType,
          style: CustomStyle.labelSmall.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Sizes.height.btnInputTitleAndBox,
        CustomDropDown(
          itemsList: controller.filterTypeList,
          selectMethod: controller.filterType,
          onChanged: (v) {
            controller.filterType.value = v?.title ?? '';
            controller.filterTypeSlug.value = v?.name ?? "";
          },
        ),
        Sizes.height.betweenInputBox,
        TextWidget(
          Strings.filterByStatus,
          style: CustomStyle.labelSmall.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Sizes.height.btnInputTitleAndBox,
        CustomDropDown(
          itemsList: controller.statusList,
          selectMethod: controller.statusType,
          onChanged: (v) {
            controller.statusType.value = v?.title ?? '';
            controller.statusTypeId.value = v?.id ?? 0;
          },
        ),
        Sizes.height.betweenInputBox,
      ],
    );
  }

  _filterButtonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.5,
      ),
      child: PrimaryButton(
        title: Strings.filterData,
        onPressed: () {
          controller.getBankStatement();
        },
      ),
    );
  }

  _transactionResultWidget() {
    return Flexible(
      child: ListView(
        shrinkWrap: true,
        children: List.generate(
          controller.transactionList.length,
          (index) => BankStatementLogWidget(
            transaction: controller.transactionList[index],
          ),
        ),
      ),
    );
  }
}
