part of '../home_screen.dart';

class _BuildListLayout extends ConsumerWidget {
  const _BuildListLayout();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _BuildBaseLayout(layoutType: LayoutType.list);
  }
}

class _BuildListItems extends StatelessWidget {
  final List<SearchResult> result;
  const _BuildListItems({required this.result});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(
          height: 1,
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: ColorResource.colorFFFFFF,
        );
      },
      shrinkWrap: true,
      itemCount: result.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = result[index];
        return InkWell(
          onTap: () {
            if (data.trackId != null) {
              _onNavigateToMediaDetail(id: data.trackId!, context: context);
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                if (data.artworkUrl100 != null)
                  _BuildNetworkImage(
                    url: data.artworkUrl100!,
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildTitleAndSubtitle(
                        name: data.trackCensoredName ?? "-",
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      BuildTitleAndSubtitle(
                        name: data.artistName ?? "-",
                        fontSize: 12,
                      ),
                      const SizedBox(height: 5),
                      BuildTitleAndSubtitle(
                        name: data.primaryGenreName ?? "-",
                        fontSize: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _onNavigateToMediaDetail(
      {required int id, required BuildContext context}) {
    final args = MediaDetailScreenArgs(id: id);
    Navigator.pushNamed(context, AppRoutes.mediaDetailScreen, arguments: args);
  }
}
