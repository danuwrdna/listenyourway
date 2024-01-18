import 'package:flutter/material.dart';
import 'package:listenyourway/view/widget/TabBarWidget.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarWidget(),
    );
  }
}
