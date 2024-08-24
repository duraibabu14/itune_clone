import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ituneclone/common/custom_scaffold.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/common/custom_textfield.dart';
import 'package:ituneclone/routes.dart';
import 'package:ituneclone/screens/home/home_screen_viewmodel.dart';
import 'package:ituneclone/screens/landing/landing_screen_viewmodel.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen_view_model.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:ituneclone/utils/image_resource.dart';
import 'package:ituneclone/utils/string_resource.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  StreamSubscription? connectivityListener;

  @override
  void initState() {
    final viewModel = ref.read(landingScreenViewModelProvider);

    viewModel.isRooted().then((isBreak) {
      if (isBreak) {
        _rootedDialog();
      } else {
        connectivityListener ??=
            Connectivity().onConnectivityChanged.listen((event) async {
          if (event.isEmpty || event.contains(ConnectivityResult.none)) {
            Navigator.pushNamed(context, AppRoutes.noInternetConnectionScreen);
          }
        });
      }
    });
    viewModel.errorStreamController.stream.listen((data) {
      AppUtils.instance().showToast(data);
    });
    super.initState();
  }

  void _rootedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
            canPop: false,
            child: Dialog(
              backgroundColor: ColorResource.colorGrey700,
              surfaceTintColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      StringResource.rootDes,
                      textAlign: TextAlign.center,
                      color: ColorResource.colorFFFFFF,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SvgPicture.asset(
              ImageResource.ituneLogo,
              colorFilter: const ColorFilter.mode(
                  ColorResource.colorFFFFFF, BlendMode.srcIn),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                  BuildSearchField(),
                  SizedBox(height: 40),
                  BuildSelectedMedias(),
                  SizedBox(height: 40),
                  BuildSubmit(),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    connectivityListener?.cancel();
    super.dispose();
  }
}

class BuildSearchField extends ConsumerWidget {
  const BuildSearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(landingScreenViewModelProvider);

    return Column(
      children: [
        const CustomText(
          StringResource.searchDescription,
          color: ColorResource.colorFFFFFF,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: viewModel.searchController,
                hint: StringResource.search,
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

///[SelectedMediaTypesForSearch]
class BuildSelectedMedias extends ConsumerWidget {
  const BuildSelectedMedias({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(landingScreenViewModelProvider);

    return Column(
      children: [
        const CustomText(
          StringResource.searchByMediaType,
          color: ColorResource.colorFFFFFF,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            _onNavigateToMediaSelection(context: context, viewModel: viewModel);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorResource.colorGrey700),
                  child: viewModel.mediaTypes.isEmpty
                      ? const CustomText(
                          StringResource.chooseMedia,
                          color: ColorResource.colorFFFFFF,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                        )
                      : Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: List.generate(
                              viewModel.mediaTypes.length,
                              (index) => Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: CustomText(
                                      viewModel.mediaTypes[index].title,
                                      color: ColorResource.colorFFFFFF,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onNavigateToMediaSelection(
      {required LandingScreenViewModel viewModel,
      required BuildContext context}) {
    final args = MediaSelectionScreenArgs(mediaTypes: viewModel.mediaTypes);
    Navigator.pushNamed(context, AppRoutes.mediaTypeSelectionScreen,
            arguments: args)
        .then((value) {
      if (value != null) {
        viewModel.addAllMediaTypes(value as List<MediaTypes>);
      }
    });
  }
}

///[Submit]
class BuildSubmit extends ConsumerWidget {
  const BuildSubmit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(landingScreenViewModelProvider);

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              _onSubmit(context: context, viewModel: viewModel);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: ColorResource.colorFFFFFF,
                  borderRadius: BorderRadius.circular(40)),
              child: const CustomText(
                StringResource.submit,
                fontSize: 16,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w800,
                color: ColorResource.color000000,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSubmit(
      {required LandingScreenViewModel viewModel,
      required BuildContext context}) {
    FocusScope.of(context).unfocus();
    if (viewModel.isSearchTextValidated()) {
      final args = HomeScreenArgs(
          mediaTypes: viewModel.mediaTypes,
          searchText: viewModel.searchController.text);
      Navigator.pushNamed(context, AppRoutes.homeScreen, arguments: args);
    }
  }
}
