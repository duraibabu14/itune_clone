import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/common/custom_app_bar.dart';
import 'package:ituneclone/common/custom_empty.dart';
import 'package:ituneclone/common/custom_loader.dart';
import 'package:ituneclone/common/custom_network_image.dart';
import 'package:ituneclone/common/custom_scaffold.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/screens/home/home_screen.dart';
import 'package:ituneclone/screens/media_detail/media_detail_screen_viewmodel.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/string_resource.dart';

class MediaDetailScreen extends ConsumerStatefulWidget {
  final MediaDetailScreenArgs args;
  const MediaDetailScreen({super.key, required this.args});

  @override
  ConsumerState<MediaDetailScreen> createState() => _MediaDetailScreenState();
}

class _MediaDetailScreenState extends ConsumerState<MediaDetailScreen> {
  @override
  void initState() {
    final viewModel = ref.read(mediaDetailProvider);
    viewModel.init(widget.args);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          onPressed: () {
            Navigator.pop(context);
          },
          title: StringResource.detail,
        ),
      ),
      body: const _BuildMainSection(),
    );
  }
}

class _BuildMainSection extends ConsumerWidget {
  const _BuildMainSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mediaDetailProvider);

    if (viewModel.isLoading) {
      return const CustomProgressIndicator();
    } else if (viewModel.searchResult == null) {
      return const CustomEmpty();
    } else {
      return const _BuildLayout();
    }
  }
}

class _BuildLayout extends ConsumerWidget {
  const _BuildLayout();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mediaDetailProvider);

    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomNetworkImage(
                imageURL: viewModel.searchResult!.artworkUrl100!,
                height: 200,
                width: 200,
                boxFit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    BuildName(
                      name: viewModel.searchResult?.trackCensoredName ?? "-",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      isSingleLine: false,
                    ),
                    const SizedBox(height: 10),
                    BuildName(
                      name: viewModel.searchResult?.artistName ?? "-",
                      fontWeight: FontWeight.w600,
                      isSingleLine: false,
                    ),
                    const SizedBox(height: 10),
                    BuildName(
                      name: viewModel.searchResult?.primaryGenreName ?? "-",
                      fontWeight: FontWeight.w600,
                      isSingleLine: false,
                      fontSize: 12,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 10),
                    BuildName(
                      name: viewModel.searchResult?.country ?? "-",
                      fontWeight: FontWeight.w600,
                      isSingleLine: false,
                      fontSize: 12,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        BuildName(
                          name: viewModel.searchResult?.contentAdvisoryRating ??
                              "-",
                          fontWeight: FontWeight.w600,
                          isSingleLine: false,
                          fontSize: 12,
                          color: Colors.amber,
                        ),
                        if (viewModel.searchResult?.trackViewUrl != null) ...[
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () {
                                AppUtils.instance().launchURL(
                                    viewModel.searchResult!.trackViewUrl!);
                              },
                              child: const Icon(
                                CupertinoIcons.compass,
                                color: Colors.blue,
                              ))
                        ]
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        if (viewModel.searchResult?.previewUrl != null) ...[
          const SizedBox(height: 20),
          const _BuildPreview(),
        ],
        if (viewModel.searchResult?.longDescription != null)
          const _BuildDescription(),
      ],
    );
  }
}

class _BuildPreview extends ConsumerStatefulWidget {
  const _BuildPreview();

  @override
  ConsumerState<_BuildPreview> createState() => _BuildPreviewState();
}

class _BuildPreviewState extends ConsumerState<_BuildPreview> {
  @override
  void initState() {
    final viewModel = ref.read(mediaDetailProvider);

    viewModel.initializePlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(mediaDetailProvider);
    return viewModel.chewieController == null
        ? const Center(
            child: CustomProgressIndicator(),
          )
        : SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 250,
            child: Chewie(
              controller: viewModel.chewieController!,
            ),
          );
  }
}

class _BuildDescription extends ConsumerWidget {
  const _BuildDescription();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(mediaDetailProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            StringResource.description,
            fontSize: 16,
            color: ColorResource.colorFFFFFF,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 5),
          CustomText(
            viewModel.searchResult?.longDescription,
            color: ColorResource.colorFFFFFF,
          )
        ],
      ),
    );
  }
}
