import 'package:flutter/material.dart';
import 'package:listenyourway/view/widget/SearchWidget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchWidget(),
    );
  }
}
