import 'package:flutter/material.dart';
import 'package:test_flutter_zens/presentation/home_view/components/home_view_base_text.dart';
import 'package:test_flutter_zens/presentation/resources/color_manager.dart';

class HomeViewButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function()? onPressed;

  const HomeViewButton(
      {super.key, required this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: HomeViewBaseText(
        text,
        color: ColorManager.white,
      ),
    );
  }
}
