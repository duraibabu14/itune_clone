import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/common/custom_app_bar.dart';
import 'package:ituneclone/common/custom_scaffold.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen_view_model.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:ituneclone/utils/string_resource.dart';

class MediaTypeSelectionScreen extends ConsumerStatefulWidget {
  final MediaSelectionScreenArgs args;
  const MediaTypeSelectionScreen({super.key, required this.args});

  @override
  ConsumerState<MediaTypeSelectionScreen> createState() =>
      _MediaTypeSelectionScreenState();
}

class _MediaTypeSelectionScreenState
    extends ConsumerState<MediaTypeSelectionScreen> {
  @override
  void initState() {
    final viewModel = ref.read(mediaTypeSelectionScreenViewModelProvider);
    viewModel.addAllMediaType(widget.args.mediaTypes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(mediaTypeSelectionScreenViewModelProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.of(context).pop(viewModel.mediaTypes);
        }
      },
      child: CustomScaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: CustomAppBar(
            onPressed: () {
              Navigator.pop(context, viewModel.mediaTypes);
            },
            title: StringResource.media,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
              itemBuilder: (context, index) {
                final media = MediaTypes.values[index];
                return InkWell(
                  onTap: () {
                    viewModel.selectMediaType(media);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          media.title,
                          color: ColorResource.colorFFFFFF,
                        ),
                        if (viewModel.mediaTypes.contains(media))
                          const Icon(
                            Icons.check,
                            size: 20,
                            color: ColorResource.colorFFFFFF,
                          )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  color: ColorResource.colorFFFFFF,
                  height: 0.5,
                  margin: const EdgeInsets.only(top: 5),
                );
              },
              itemCount: MediaTypes.values.length),
        ),
      ),
    );
  }
}
