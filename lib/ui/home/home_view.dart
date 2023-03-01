import 'package:flutter/material.dart';

import '../../assets/custom_icons.dart';
import '../common/custom_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomIcon(CustomIcons.logo),
      ),
    );
  }
}
