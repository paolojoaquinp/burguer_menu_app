import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Milkshakes',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          padding:  const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.vertical,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                child: _buildMilkshakeCard(index + 1));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
