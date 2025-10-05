import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/animations/custom_loading_widget.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/edit_profile_info.dart';
import 'package:tranquilo_app/features/profile/logic/providers/profile_provider.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/app_bar_profile_screens.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    // Fetch profile when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userProfileProvider.notifier).fetchUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      body: SafeArea(
        child: profileAsync.when(
          data: (profile) {
            if (profile == null) {
              return const Center(child: Text('Failed to load profile'));
            }
            return buildProfileScreen(context, profile.model);
          },
          loading: () => const CustomLoadingWidget(),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        ),
      ),
    );
  }

  Widget buildProfileScreen(BuildContext context, Model profile) {
    return Column(
      children: [
        verticalSpace(20),
        const AppBarProfileScreens(titleAppBar: 'Edit Profile'),
        verticalSpace(32),
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                showProfileOptionsBottomSheet(context);
              },
              child: SizedBox(
                width: 134.w,
                height: 134.h,
                child: ClipOval(
                  child: _selectedImage != null
                      ? Image.file(_selectedImage!, fit: BoxFit.cover)
                      : SvgPicture.asset('assets/svgs/default_profile.svg'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset('assets/svgs/edit_profile_pic.svg'),
            ),
          ],
        ),
        verticalSpace(40),
        EditProfileInfo(infoTitle: 'Full Name', initialValue: profile.userName),
        verticalSpace(18),
        EditProfileInfo(infoTitle: 'Email', initialValue: profile.email),
        const Spacer(),
        AppTextButton(
          onPressed: () {
            // Implement save action
          },
          textButton: 'Save',
        ),
        verticalSpace(35),
      ],
    );
  }

  void showProfileOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: ColorsManager.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.r),
          height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: ColorsManager.oceanBlue,
                ),
                title: Text(
                  'Camera',
                  style: TextStyles.font14JetBlackMedium,
                ),
                onTap: () async {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: ColorsManager.oceanBlue,
                ),
                title: Text(
                  'Gallery',
                  style: TextStyles.font14JetBlackMedium,
                ),
                onTap: () async {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete,
                  color: ColorsManager.red,
                ),
                title: Text(
                  'Delete photo',
                  style: TextStyles.font14JetBlackMedium,
                ),
                onTap: () {
                  setState(() {
                    _selectedImage = null;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }
}