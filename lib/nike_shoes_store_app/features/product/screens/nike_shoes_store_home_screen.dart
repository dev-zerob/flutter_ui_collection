import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/models/nike_shoes.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/screens/components/bottom_navigator_bar.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/screens/nike_shoes_store_detail_screen.dart';

class NikeShoesStoreHomeScreen extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onShoesPressed(BuildContext context, NikeShoes shoesItem) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: NikeShoesStoreDetailScreen(),
          );
        },
      ),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    child: Image.asset(
                      'assets/nike_shoes_store/images/nike_logo.png',
                      height: 40.0,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final NikeShoes nikeShoes = shoes[index];
                        return NikeShoesListItem(
                          nikeShoes: nikeShoes,
                          onTap: () => _onShoesPressed(context, nikeShoes),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: notifierBottomBarVisible,
              child: BottomNavigatorBar(),
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: 0.0,
                  right: 0.0,
                  bottom: value ? 0.0 : -kToolbarHeight,
                  height: kToolbarHeight,
                  child: child ?? Container(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NikeShoesListItem extends StatelessWidget {
  final NikeShoes nikeShoes;
  final VoidCallback? onTap;

  const NikeShoesListItem({
    Key? key,
    required this.nikeShoes,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Container(
          height: itemHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(nikeShoes.color),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: itemHeight * 0.65,
                  child: FittedBox(
                    child: Text(
                      nikeShoes.modelNumber.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.05),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                left: 100.0,
                height: itemHeight * 0.7,
                child: Image.asset(
                  nikeShoes.images.first,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      nikeShoes.model,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '${nikeShoes.discountedPrice.toString()} won',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '${nikeShoes.price.toString()} won',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
