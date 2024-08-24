import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ituneclone/common/custom_app_bar.dart';
import 'package:ituneclone/common/custom_empty.dart';
import 'package:ituneclone/common/custom_loader.dart';
import 'package:ituneclone/common/custom_network_image.dart';
import 'package:ituneclone/common/custom_scaffold.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/routes.dart';
import 'package:ituneclone/screens/home/home_screen_viewmodel.dart';
import 'package:ituneclone/screens/media_detail/media_detail_screen_viewmodel.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:ituneclone/utils/string_resource.dart';

part 'components/base_layout.dart';
part 'components/grid_layout.dart';
part 'components/list_layout.dart';
part 'components/shared_widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final HomeScreenArgs args;
  const HomeScreen({super.key, required this.args});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    final viewModel = ref.read(homeScreenViewModelProvider);
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
          title: StringResource.iTunes,
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
    final viewModel = ref.watch(homeScreenViewModelProvider);

    if (viewModel.isLoading) {
      return const CustomProgressIndicator();
    } else if (viewModel.searchResult.isEmpty) {
      return const CustomEmpty();
    } else {
      return const _BuildLayout();
    }
  }
}

///[Layout]
class _BuildLayout extends ConsumerStatefulWidget {
  const _BuildLayout();

  @override
  ConsumerState<_BuildLayout> createState() => _BuildLayoutState();
}

class _BuildLayoutState extends ConsumerState<_BuildLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final viewModel = ref.read(homeScreenViewModelProvider);

    viewModel.tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(homeScreenViewModelProvider);

    return Column(
      children: [
        TabBar(
          unselectedLabelColor: ColorResource.colorGrey700,
          labelColor: ColorResource.colorFFFFFF,
          unselectedLabelStyle: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w600,
          ),
          labelStyle: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
          padding: EdgeInsets.zero,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringResource.gridLayout,
                    style: GoogleFonts.nunitoSans(),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.view_module_outlined, size: 20),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringResource.listLayout,
                    style: GoogleFonts.nunitoSans(),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.list, size: 20),
                ],
              ),
            ),
          ],
          indicatorSize: TabBarIndicatorSize.tab,
          controller: viewModel.tabController,
          indicatorColor: ColorResource.colorFFFFFF,
        ),
        Expanded(
          child: TabBarView(
            controller: viewModel.tabController,
            children: const [_BuildGridLayout(), _BuildListLayout()],
          ),
        ),
      ],
    );
  }
}
