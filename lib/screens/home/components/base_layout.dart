part of '../home_screen.dart';

class _BuildBaseLayout extends ConsumerWidget {
  final LayoutType layoutType;
  const _BuildBaseLayout({required this.layoutType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeScreenViewModelProvider);
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = viewModel.searchResult[index];
          if (item.result.isEmpty) {
            return Container();
          }
          return Column(
            children: [
              _BuildHeader(item: item),
              if (layoutType == LayoutType.list)
                _BuildListItems(result: item.result)
              else
                _BuildGridItems(result: item.result)
            ],
          );
        },
        itemCount: viewModel.searchResult.length);
  }
}

class _BuildHeader extends StatelessWidget {
  final SearchResultModel item;
  const _BuildHeader({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: ColorResource.color2f2f2f,
              ),
              child: CustomText(
                item.kind.title,
                color: ColorResource.colorFFFFFF,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
