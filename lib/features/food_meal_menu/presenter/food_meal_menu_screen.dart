import 'package:flutter/material.dart';

class FoodMealMenuScreen extends StatefulWidget {
  const FoodMealMenuScreen({super.key});

  @override
  State<FoodMealMenuScreen> createState() => _FoodMealMenuScreenState();
}

class _FoodMealMenuScreenState extends State<FoodMealMenuScreen> {
  final _pageController = PageController(viewportFraction: .3, initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_bag_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Caramel',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Machiato',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  Text(
                    '£5.78',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ScalePageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Image.asset(
                  'assets/milkshakes/shake-${index + 1}.png',
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScalePageView extends StatefulWidget {
  final PageController controller;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Axis scrollDirection;

  const ScalePageView({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);

  @override
  State<ScalePageView> createState() => _ScalePageViewState();
}

class _ScalePageViewState extends State<ScalePageView> {
  late PageController _pageController;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller;
    _pageController.addListener(_onPageChange);
  }

  void _onPageChange() {
    setState(() {
      _currentPage = _pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: widget.scrollDirection,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        // Calculate base values for transformations
        final double pageOffset = _currentPage - index;
        
        // Scale calculation (0.7 to 1.0)
        double scale = 1.0;
        if (pageOffset >= 0) {
          scale = 1 - (pageOffset * 0.3).clamp(0.0, 0.3);
        } else {
          scale = 1 - (-pageOffset * 0.3).clamp(0.0, 0.3);
        }
        
        // Translate calculation (move items up/down)
        double translateY = 0.0;
        if (widget.scrollDirection == Axis.vertical) {
          translateY = pageOffset * 50; // 50 pixels offset per page
        }
        
        // Opacity calculation (fade out as items move away)
        double opacity = 1.0;
        if (pageOffset > 0) {
          opacity = (1 - pageOffset).clamp(0.3, 1.0);
        } else if (pageOffset < 0) {
          opacity = (1 + pageOffset).clamp(0.3, 1.0);
        }

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..translate(0.0, translateY)
            ..scale(scale),
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacity,
            child: Container(
              padding: EdgeInsets.only(
                top: index == 0 ? 0 : 20,
                bottom: index == widget.itemCount - 1 ? 0 : 20,
              ),
              child: widget.itemBuilder(context, index),
            ),
          ),
        );
      },
    );
  }
}