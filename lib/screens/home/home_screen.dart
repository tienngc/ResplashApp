import 'package:flutter/material.dart';

import '../../widgets/main_bottom_app_bar.dart';
import '../../widgets/tab_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabLayout(),
      bottomNavigationBar: MainBottomAppBar(),
      floatingActionButton: SizedBox(
        width: 48,
        height: 48,
        child: FloatingActionButton(onPressed: () {}, shape: const CircleBorder(), child: Icon(Icons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
