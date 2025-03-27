import 'package:flutter/material.dart';

class MainBottomAppBar extends StatelessWidget {
  const MainBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      notchMargin: 8,
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
      height: 57,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(50, 50, 50, 0.1),
                  Color.fromRGBO(50, 50, 50, 0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 1),
              BottomAppBar(
                notchMargin: 8,
                shape: const CircularNotchedRectangle(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu_outlined),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.sort),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}