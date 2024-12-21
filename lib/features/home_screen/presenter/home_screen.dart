import 'dart:ui';

import 'package:burguer_menu_app/features/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        title: Text('Menu',
            style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.vertical,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    child: _buildMilkshakeCard(index + 1));
              },
            ),
          ),
          Positioned(
            bottom: 0,
            height: MediaQuery.sizeOf(context).height * 0.1,
            width: MediaQuery.sizeOf(context).width,
            child: const CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildMilkshakeCard(int index) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background
            Positioned(
              bottom: 0,
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 9,
                    )
                  ],
                ),
              ),
            ),
            // INformation
            Positioned.fill(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/milkshakes/shake-1.png'),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.3,
                          ),
                          Text(
                            'Chocolate Drinks',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text('20 Cups of different flavours'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
