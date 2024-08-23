part of '../home_screen.dart';

class _BuildGridLayout extends ConsumerWidget {
  const _BuildGridLayout();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _BuildBaseLayout(layoutType: LayoutType.grid);
  }
}

class _BuildGridItems extends StatelessWidget {
  final List<SearchResult> result;
  const _BuildGridItems({required this.result});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: result.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = result[index];
        return InkWell(
          onTap: () {
            if (data.trackId != null) {
              final args = MediaDetailScreenArgs(id: data.trackId!);
              Navigator.pushNamed(context, AppRoutes.mediaDetailScreen,
                  arguments: args);
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                if (data.artworkUrl100 != null)
                  _BuildNetworkImage(
                    url: data.artworkUrl100!,
                  ),
                const SizedBox(height: 10),
                BuildName(
                  name: data.trackCensoredName ?? "-",
                ),
                const SizedBox(height: 5),
                BuildName(
                  name: data.artistName ?? "-",
                  fontSize: 12,
                ),
                const SizedBox(height: 5),
                BuildName(
                  name: data.primaryGenreName ?? "-",
                  fontSize: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
