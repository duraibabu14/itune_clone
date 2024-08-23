import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageURL;

  final BoxFit? boxFit;

  const CustomNetworkImage({
    super.key,
    this.height,
    required this.imageURL,
    this.width,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageURL,
      width: width,
      height: height,
      handleLoadingProgress: true,
      fit: boxFit ?? BoxFit.cover,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const Center(child: CircularProgressIndicator());

          case LoadState.completed:
            return ExtendedRawImage(
              fit: boxFit ?? BoxFit.cover,
              width: width,
              height: height,
              image: state.extendedImageInfo?.image,
            );
          case LoadState.failed:
            return GestureDetector(
              child: const Center(child: Icon(Icons.error)),
              onTap: () {
                state.reLoadImage();
              },
            );
        }
      },
      enableMemoryCache: false,
    );
  }
}
