/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'package:bagisto_app_demo/screens/account/utils/index.dart';

class ProfileImageView extends StatefulWidget {
  final Function(String? base64string)? callback;

  const ProfileImageView({Key? key, this.callback}) : super(key: key);

  @override
  State<ProfileImageView> createState() => _ProfileImageViewState();
}

class _ProfileImageViewState extends State<ProfileImageView> {
  String profileImageEdit = "";
  String? base64string;
  XFile? image;
  XFile selectedImage = XFile("");

  @override
  void initState() {
    image = null;
    profileImageEdit = appStoragePref.getCustomerImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.spacingNormal),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
          color: MobiKulTheme.accentColor),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          GestureDetector(
              onTap: () {
                _showChoiceBottomSheet(context);
              },
              child: CircleAvatar(
                radius: AppSizes.screenWidth * 0.13,
                backgroundImage: const AssetImage(AssetConstants.customerProfilePlaceholder),
                backgroundColor: Colors.white,
                foregroundImage: (image != null)
                    ? FileImage(File(image!.path))
                    : (profileImageEdit.isNotEmpty)
                        ? NetworkImage('$profileImageEdit?${DateTime.now().millisecondsSinceEpoch.toString()}')
                        : Image.asset(AssetConstants.customerProfilePlaceholder).image,
              )),
          GestureDetector(
            onTap: () {
              _showChoiceBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(AppSizes.spacingNormal),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.spacingLarge),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              child:  Icon(
                Icons.camera_alt,
                size: 18,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showChoiceBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).cardColor,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSizes.spacingLarge, AppSizes.spacingLarge, 0, AppSizes.spacingLarge),
                child: Text(
                  StringConstants.chooseOption.localized(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.folder,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                title: Text(StringConstants.gallery.localized(),
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  _openGallery(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                title: Text(
                  StringConstants.camera.localized(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () {
                  _openCamera(context);
                },
              )
            ],
          );
        });
  }

  void _openCamera(BuildContext context) async {
    await ImagePicker()
        .pickImage(
      source: ImageSource.camera,
    )
        .then((value) async {
      selectedImage = XFile(value?.path ?? "");
      Uint8List imageBytes =
          await selectedImage.readAsBytes(); //convert to bytes
      base64string = base64.encode(imageBytes);
      widget.callback!(base64string);
      setState(() {
        image = value;
      });
    });
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    await ImagePicker()
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((value) async {
      selectedImage = XFile(value?.path ?? "");
      Uint8List imageBytes =
          await selectedImage.readAsBytes(); //convert to bytes
      base64string = base64.encode(imageBytes);
      widget.callback!(base64string);
      setState(() {
        image = value;
      });
    });
    if(context.mounted){
      Navigator.pop(context);
    }
  }
}
