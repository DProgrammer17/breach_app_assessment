import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/utils/extensions/string_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNetworkImage extends StatelessWidget {
  final String? image;
  final String? placeholderImage;
  final double? height;
  final double? width;
  final double? loaderWidth;
  final double? loaderHeight;
  final double? radius;
  final BoxShape? shape;
  final bool useBorderRadius;
  final Widget? errorImage;

  const AppNetworkImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.loaderWidth,
    this.loaderHeight,
    this.radius,
    this.placeholderImage,
    this.shape,
    this.errorImage,
    this.useBorderRadius = true,
  });

  @override
  Widget build(BuildContext context) {
    return image.isBlank
        ? Image.asset(
            placeholderImage ?? AppAssets.profileImagePlaceholder,
            height: height ?? 58.ah,
            width: width ?? 58.aw,
          )
        : image!.contains('.svg')
        ? ClipRRect(
            borderRadius: useBorderRadius
                ? BorderRadius.all(Radius.circular(radius ?? 16.ar))
                : const BorderRadius.only(),
            child: SvgPicture.network(
              image!,
              height: height,
              width: width,
              fit: BoxFit.fitWidth,
              placeholderBuilder: (context) => SizedBox(
                width: loaderWidth,
                child: const CircularProgressIndicator(
                  color: AppColors.primaryPurple600,
                ),
              ),
            ),
          )
        : CachedNetworkImage(
            imageUrl: image!,
            imageBuilder: (context, imageProvider) => Container(
              height: height ?? 58.ah,
              width: width ?? 58.aw,
              decoration: BoxDecoration(
                shape: shape ?? BoxShape.rectangle,
                color: AppColors.grey600,
                borderRadius: useBorderRadius
                    ? BorderRadius.all(Radius.circular(radius ?? 16.ar))
                    : null,
                image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
              ),
            ),
            placeholder: (context, url) => Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: loaderWidth,
                height: loaderHeight,
                child: const CircularProgressIndicator(
                  color: AppColors.primaryPurple600,
                ),
              ),
            ),
            errorWidget: (context, url, error) => ClipRRect(
              borderRadius: useBorderRadius
                  ? BorderRadius.all(Radius.circular(radius ?? 16.ar))
                  : const BorderRadius.only(),
              child:
                  errorImage ??
                  Image.asset(
                    placeholderImage ?? AppAssets.profileImagePlaceholder,
                    height: height ?? 58.ah,
                    width: width ?? 58.aw,
                  ),
            ),
          );
  }
}
