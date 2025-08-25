part of 'profile_screen.dart';

class ProfileMobileScreen extends GetView<ProfileController> {
  const ProfileMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: const CustomAppBar(Strings.editProfile),
        body: controller.isLoading ? Loader() : _bodyWidget(context),
        bottomNavigationBar: controller.isUpdateLoading
            ? Container(
                height: Dimensions.heightSize * 3,
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.verticalSize,
                ),
                child: Loader(),
              )
            : (controller.isLoading ? null : _buttonWidget(context)),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        children: [
          ProfileImagePicker(),
          ProfileInputWidget(),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.defaultHorizontalSize,
        right: Dimensions.defaultHorizontalSize,
        bottom: Dimensions.verticalSize * 0.6,
        top: Dimensions.verticalSize * 0.2,
      ),
      child: Obx(
        () => PrimaryButton(
          title: Strings.update,
          disable: false,
          isLoading: controller.isUpdateLoading,
          onPressed: () {
            controller.updateProfile();
          },
        ),
      ),
    );
  }
}
