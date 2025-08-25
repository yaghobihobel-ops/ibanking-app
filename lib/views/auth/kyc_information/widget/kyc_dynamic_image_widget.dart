import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/auth/kyc_information/controller/kyc_information_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../../base/utils/basic_import.dart';

File? imageFile;

class UpdateKycImageWidget extends StatefulWidget {
  const UpdateKycImageWidget({
    super.key,
    required this.labelName,
    required this.fieldName,
    this.image = '',
    this.isAvailableData = false,
  });

  final String labelName;
  final String fieldName;
  final String image;
  final bool isAvailableData;

  @override
  State<UpdateKycImageWidget> createState() => _DropFileState();
}

class _DropFileState extends State<UpdateKycImageWidget> {
  final controller = Get.put(KycInformationController());

  Future pickImage(imageSource) async {
    try {
      final image =
          await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
      if (image == null) return;

      imageFile = File(image.path);

      if (controller.listFieldName.isNotEmpty) {
        if (controller.listFieldName.contains(widget.fieldName)) {
          int itemIndex = controller.listFieldName.indexOf(widget.fieldName);
          controller.listFieldName[itemIndex] = widget.fieldName;
          controller.listImagePath[itemIndex] = imageFile!.path;
        } else {
          controller.listImagePath.add(imageFile!.path);
          controller.listFieldName.add(widget.fieldName);
        }
      } else {
        controller.listImagePath.add(imageFile!.path);
        controller.listFieldName.add(widget.fieldName);
      }
      setState(() {
        controller.updateImageData(widget.fieldName, imageFile!.path);
      });
      Get.back();
    } on PlatformException catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    print(widget.image);
    return IgnorePointer(
      ignoring: widget.isAvailableData,
      child: InkWell(
        onTap: () {
          _showImagePickerBottomSheet(context);
        },
        child: Container(
          decoration: BoxDecoration(
            border: RDottedLineBorder.all(
              color: Get.isDarkMode
                  ? CustomColor.whiteColor.withOpacity(0.2)
                  : CustomColor.blackColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              TextWidget(
                widget.labelName,
                typographyStyle: TypographyStyle.labelSmall,
                padding: EdgeInsets.only(
                  left: Dimensions.horizontalSize * 0.6,
                  right: Dimensions.horizontalSize * 0.6,
                  top: Dimensions.verticalSize * 0.4,
                ),
              ),
              SizedBox(height: Dimensions.spaceBetweenInputTitleAndBox * 0.6),
              Container(
                height: Dimensions.heightSize * 6,
                alignment: Alignment.center,
                margin: EdgeInsets.all(
                  Dimensions.horizontalSize * 0.25,
                ),
                decoration: widget.isAvailableData
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.image),
                        ),
                      )
                    : controller.getImagePath(widget.fieldName) == null
                        ? BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius),
                          )
                        : BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(
                                  controller.getImagePath(widget.fieldName) ??
                                      '',
                                ),
                              ),
                            ),
                          ),
                child: imageFile == null
                    ? Column(
                        mainAxisAlignment: mainCenter,
                        mainAxisSize: mainMin,
                        children: [
                          Icon(
                            Iconsax.document_upload,
                            color: Get.isDarkMode
                                ? CustomColor.whiteColor.withOpacity(0.3)
                                : CustomColor.blackColor.withOpacity(0.3),
                          ),
                          TextWidget(
                            Strings.upload,
                            textOverflow: TextOverflow.fade,
                            color: Get.isDarkMode
                                ? CustomColor.whiteColor.withOpacity(0.2)
                                : CustomColor.blackColor.withOpacity(0.2),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: ImagePickerSheet(
            fromCamera: () {
              pickImage(ImageSource.camera);
            },
            fromGallery: () {
              pickImage(ImageSource.gallery);
            },
          ),
        );
      },
    );
  }
}
