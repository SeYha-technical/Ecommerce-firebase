import 'package:ecommerce_bloc/presentation/setting/widget/my_order_tile.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(title: Text('Settings')),
      body: MyOrdersTile(),
    );
  }
}
