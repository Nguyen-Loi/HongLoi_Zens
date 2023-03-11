import 'package:flutter/material.dart';
import 'package:test_flutter_zens/presentation/home_view/components/home_view_base_text.dart';
import 'package:test_flutter_zens/presentation/home_view/components/home_view_body.dart';
import 'package:test_flutter_zens/presentation/home_view/components/home_view_footer.dart';
import 'package:test_flutter_zens/presentation/resources/assets_manager.dart';
import 'package:test_flutter_zens/presentation/resources/color_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          banner(),
          Expanded(
            child: body(),
          )
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      children: const [
        Expanded(
          child: HomeViewBody(),
        ),
        HomeViewFooter()
      ],
    );
  }

  Widget banner() {
    return Container(
      color: ColorManager.green,
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeViewBaseText(
            'A Joke a day keep the doctor away',
            color: ColorManager.white,
            fontSize: 24,
          ),
          const SizedBox(height: 32),
          HomeViewBaseText(
              'If you joke wrong away, your teeth have to pay. (Serious)',
              color: ColorManager.white)
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              radius: 18,
              child: Image.asset(
                ImageAssets.logo,
              )),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HomeViewBaseText(
                    'Handicrafted by',
                    color: ColorManager.grey,
                  ),
                  const SizedBox(height: 8),
                  HomeViewBaseText(
                    'Jim HLS',
                    color: ColorManager.black,
                    fontSize: 14,
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(radius: 15, child: Image.asset(ImageAssets.user)),
            ],
          )
        ],
      ),
    );
  }
}
