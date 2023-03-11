import 'package:flutter/material.dart';
import 'package:test_flutter_zens/presentation/home_view/components/home_view_base_text.dart';
import 'package:test_flutter_zens/presentation/resources/color_manager.dart';

class HomeViewFooter extends StatelessWidget {
  const HomeViewFooter({super.key});

  final String strContent =
      'This app is created as part of Hisolutions program. The materials contained '
      'on this website are provided for general information only and do not constitute any form of advice.'
      'HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability'
      ' for any loss or damage which may arise from reliance on the information contained on this site.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          Divider(color: ColorManager.grey, endIndent: 8, thickness: 0.2),
          HomeViewBaseText(
            strContent,
            color: ColorManager.grey,
          ),
          const SizedBox(height: 16),
          const HomeViewBaseText('Copyright 2021 HLS'),
        ],
      ),
    );
  }
}
