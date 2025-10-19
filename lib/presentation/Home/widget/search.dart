import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../../serach/pages/search.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        readOnly: true,
        onTap: () {
          AppNavigator.push(context, const SearchTextField());
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: SvgPicture.asset(AppVectors.search, fit: BoxFit.none),
          hintText: 'search',
        ),
      ),
    );
  }
}
