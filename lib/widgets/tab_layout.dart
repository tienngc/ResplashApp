import 'package:flutter/material.dart';
import 'package:resplash/screens/tabview/photo/photo_tab_view.dart';

enum TabLayoutStyle { home, collection }

class TabLayout extends StatefulWidget {
  const TabLayout({super.key});

  @override
  State<TabLayout> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> with SingleTickerProviderStateMixin {
  final _homeTabs = [
    Tab(text: "HOME"),
    Tab(text: "COLLECTIONS"),
  ];

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: TabBarView(
              controller: tabController,
              children: const [
                HomeTab(),
                Text("Collections"),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: TabBar(
              tabs: _homeTabs,
              controller: tabController,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ],
      ),
    );
  }
}
