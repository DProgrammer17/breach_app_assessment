import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/features/home/widget/news_details_tile.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/page_widgets/no_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamPage extends ConsumerStatefulWidget {
  const StreamPage({super.key});

  @override
  ConsumerState<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends ConsumerState<StreamPage>
    with AutomaticKeepAliveClientMixin {
  final bool _keepAlive = true;

  @override
  bool get wantKeepAlive => _keepAlive;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifier.notifier).initWebSocket(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.streams,
          style: AppTextStyles.h1Grotesk(
            context,
          ).copyWith(fontSize: 28.asp, color: AppColors.grey900),
        ),
        3.sbH,
        Text(
          AppStrings.streamsSubText,
          style: AppTextStyles.body4RegularGrotesk(context),
        ),
        10.sbH,
        Divider(thickness: 1.aw, color: AppColors.grey300),
        18.sbH,
        Builder(
          builder: (context) {
            if (ref.watch(homeNotifier).newsStream.isEmpty) {
              return NoDataPage(
                title: ref.watch(homeNotifier).connectedSocket
                    ? AppStrings.hangOn
                    : ErrorStrings.oops,
                subtitle: ref.watch(homeNotifier).connectedSocket
                    ? AppStrings.weAreLoadingStreams
                    : ErrorStrings.noPostAvailable,
                showButton: !ref.watch(homeNotifier).connectedSocket,
                buttonAction: () =>
                    ref.read(homeNotifier.notifier).initWebSocket(context),
                buttonTitle: AppStrings.refresh,
              );
            }
            return Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: ref.watch(homeNotifier).newsStream.length,
                itemBuilder: (_, index) => NewDetailsTile(
                  post: ref.watch(homeNotifier).newsStream.elementAt(index),
                ),
                separatorBuilder: (_, int index) {
                  return Column(
                    children: [
                      8.sbH,
                      Divider(thickness: 1.aw, color: AppColors.grey300),
                      8.sbH,
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
