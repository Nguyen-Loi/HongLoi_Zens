import 'package:flutter/material.dart';
import 'package:test_flutter_zens/controller/home_view_body_controller.dart';
import 'package:test_flutter_zens/model/joke.dart';
import 'package:test_flutter_zens/presentation/home_view/components/home_view_base_text.dart';
import 'package:test_flutter_zens/presentation/home_view/components/home_view_button.dart';
import 'package:test_flutter_zens/presentation/resources/color_manager.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late HomeViewBodyController controller;

  @override
  void initState() {
    controller = HomeViewBodyController();
    controller.init();
    super.initState();
  }

  void onVoteSubmit({required bool isFunny}) {
    setState(() {
      controller.voteSubmit(isFunny);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: controller.list.isEmpty
          ? FutureBuilder(
              future: controller.loadData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return HomeViewBaseText(
                    'Có lỗi xãy ra',
                    color: ColorManager.red,
                  );
                } else {
                  if (snapshot.data == null) {
                    return HomeViewBaseText('Không có dữ liệu',
                        color: ColorManager.red);
                  }
                  controller.setData(snapshot.data);
                  return showData();
                }
              })
          : showData(),
    );
  }

  Widget showData() {
    return controller.isFinish ? finishVote() : showVote();
  }

  Widget showVote() {
    List<JokeModel> list = controller.list;
    return Column(
      children: [
        Expanded(
          child: HomeViewBaseText(
            list[controller.currentIndex].title,
            color: ColorManager.black,
          ),
        ),
        //Row button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeViewButton(
                text: 'This is Funny!',
                onPressed: () {
                  onVoteSubmit(isFunny: true);
                },
                color: ColorManager.blue),
            const SizedBox(width: 24),
            HomeViewButton(
              text: 'This is not Funny.',
              onPressed: () {
                onVoteSubmit(isFunny: false);
              },
              color: ColorManager.green,
            ),
          ],
        )
      ],
    );
  }

  Widget finishVote() {
    return const Center(
      child: HomeViewBaseText(
        'That\'s all the jokes for today! Come back another day!',
        fontSize: 17,
      ),
    );
  }
}
