import 'package:flutter/material.dart';

class NikeShoesStoreDetailScreen extends StatelessWidget {
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ValueListenableBuilder<bool>(
                valueListenable: notifierButtonsVisible,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'fav_1',
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      FloatingActionButton(
                        heroTag: 'fav_2',
                        onPressed: () {},
                        backgroundColor: Colors.black,
                        child: Icon(Icons.shopping_cart),
                      ),
                    ],
                  ),
                ),
                builder: (context, value, child) {
                  return AnimatedPositioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: value ? 0.0 : -kToolbarHeight,
                    duration: const Duration(milliseconds: 200),
                    child: child ?? Container(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
