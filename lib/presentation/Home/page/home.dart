import 'package:ecommerce_bloc/presentation/Home/widget/categories.dart';
import 'package:ecommerce_bloc/presentation/Home/widget/get_new_in.dart';
import 'package:ecommerce_bloc/presentation/Home/widget/top_selling.dart';
import 'package:flutter/material.dart';

import '../widget/home_header.dart';
import '../widget/search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24),
            HomeSearchField(),
            SizedBox(height: 24),
            Categories(),
            SizedBox(height: 24),
            TopSelling(),
            SizedBox(height: 24),
            NewIn(),
          ],
        ),
      ),
    );
  }
}
