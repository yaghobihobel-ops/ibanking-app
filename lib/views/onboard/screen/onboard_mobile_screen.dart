part of 'onboard_screen.dart';

class OnboardMobileScreen extends GetView<OnboardController> {
  const OnboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _clipViewWidget(context),
          _otherWidget(context),
          _logoWidget(context)
        ],
      ),
    );
  }

  _otherWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalSize * 0.8,
      ),
      child: Column(
        mainAxisSize: mainMin,
        crossAxisAlignment: crossStart,
        children: [
          _contentWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _clipViewWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          controller: controller.pageController,
          itemCount: BasicServices.onboardScreen.length,
          itemBuilder: (BuildContext context, int index) {
            var data = BasicServices.onboardScreen[index];
            return CachedNetworkImage(
              height: MediaQuery.of(context).size.height,
              imageUrl:
                  "${BasicServices.basePath.value}/${BasicServices.pathLocation.value}/${data.image}",
              placeholder: (context, url) => Container(),
              errorWidget: (context, url, error) => Container(),
              fit: BoxFit.cover,
            );
          },
          onPageChanged: (v) {
            controller.selectedIndex.value = v;
          },
        ),
      ],
    );
  }

  _indicatorWidget(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: mainCenter,
        children: List.generate(
          BasicServices.onboardScreen.length,
          (index) => Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSize * 0.15,
            ),
            height: index == controller.selectedIndex.value
                ? Dimensions.heightSize * 2.5
                : Dimensions.heightSize * 1.8,
            alignment: Alignment.center,
            width: Dimensions.widthSize * 0.6,
            decoration: BoxDecoration(
              color: index == controller.selectedIndex.value
                  ? CustomColor.primary
                  : CustomColor.primary.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  _contentWidget(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: crossStart,
        children: [
          TextWidget(
            BasicServices.onboardScreen[controller.selectedIndex.value].heading,
            fontWeight: FontWeight.w700,
            typographyStyle: TypographyStyle.headlineSmall,
          ),
          TextWidget(
            BasicServices.onboardScreen[controller.selectedIndex.value].title,
            fontWeight: FontWeight.w600,
            typographyStyle: TypographyStyle.titleMedium,
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.verticalSize * 0.3,
            ),
          ),
          TextWidget(
            BasicServices.onboardScreen[controller.selectedIndex.value].details,
            typographyStyle: TypographyStyle.labelLarge,
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 1.5,
      ),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          _skip(),
          _indicatorWidget(context),
          _next(),
        ],
      ),
    );
  }

  _logoWidget(BuildContext context) {
    return Positioned(
      top: 0,
      child: BrandLogo(),
    );
  }

  _skip() {
    return GestureDetector(
      onTap: () {
        LocalStorage.save(onboardSave: true);
        Get.offAllNamed(Routes.loginScreen);
      },
      child: TextWidget(
        Strings.skip,
        typographyStyle: TypographyStyle.labelLarge,
      ),
    );
  }

  _next() {
    return GestureDetector(
      onTap: () {
        final currentPage = controller.selectedIndex.value;
        if (currentPage < BasicServices.onboardScreen.length - 1) {
          controller.pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          LocalStorage.save(onboardSave: true);
          Get.offAllNamed(Routes.loginScreen);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSize * 0.6,
          vertical: Dimensions.verticalSize * 0.5,
        ),
        decoration: BoxDecoration(
          color: CustomColor.primary,
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        ),
        child: Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
