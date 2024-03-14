import 'package:flutter/material.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: 'Job Studio',
        hasBackButton: false,
        centerTitle: false,
      ),
      body: const Center(
        child: TextWidget(
          'Search Screen',
          fontSize: 30,
        ),
      ),
    );
  }
}
