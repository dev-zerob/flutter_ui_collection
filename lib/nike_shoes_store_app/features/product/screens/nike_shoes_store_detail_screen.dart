import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/main/widget/shake_transaition.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/models/nike_shoes.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/screens/nike_shoes_store_shopping_cart_screen.dart';

class NikeShoesStoreDetailScreen extends StatelessWidget {
  final NikeShoes nikeShoes;
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  NikeShoesStoreDetailScreen({
    Key? key,
    required this.nikeShoes,
  }) : super(key: key);

  void _openShoppingCart(BuildContext context) async {
    notifierButtonsVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: NikeShoesStoreShoppingCartScreen(
              nikeShoes: nikeShoes,
            ),
          );
        },
      ),
    );
    notifierButtonsVisible.value = true;
  }

  Widget _buildCarousel(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.6,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: 'background_${nikeShoes.modelNumber}',
              child: Container(
                color: Color(nikeShoes.color),
              ),
            ),
          ),
          Positioned(
            left: 70.0,
            right: 70.0,
            top: 10.0,
            child: Hero(
              tag: 'modelNumber_${nikeShoes.modelNumber}',
              child: ShakeTransition(
                offset: 15,
                duration: const Duration(milliseconds: 1400),
                axis: Axis.vertical,
                child: Material(
                  color: Colors.transparent,
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
            ),
          ),
          PageView.builder(
            itemCount: nikeShoes.images.length,
            itemBuilder: (context, index) {
              final tag = index == 0 ? 'image_${nikeShoes.modelNumber}' : 'image_${nikeShoes.modelNumber}_$index';

              return Container(
                alignment: Alignment.center,
                child: ShakeTransition(
                  duration: index == 0 ? const Duration(milliseconds: 900) : Duration.zero,
                  axis: Axis.vertical,
                  offset: 10.0,
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      nikeShoes.images[index],
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/nike_shoes_store/images/nike_logo.png',
          height: 40.0,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildCarousel(context),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ShakeTransition(
                          duration: const Duration(milliseconds: 1100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                nikeShoes.model,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '${nikeShoes.price.toString()} 원',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12.0,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text(
                                      '${nikeShoes.discountedPrice.toString()} 원',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ShakeTransition(
                          duration: const Duration(milliseconds: 1100),
                          child: Text(
                            'AVAILABLE SIZES',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ShakeTransition(
                          duration: const Duration(milliseconds: 1100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _ShoesSizeItem(text: '240'),
                              _ShoesSizeItem(text: '250'),
                              _ShoesSizeItem(text: '260'),
                              _ShoesSizeItem(text: '270'),
                              _ShoesSizeItem(text: '280'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'DESCRIPTION',
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
                      onPressed: () => _openShoppingCart(context),
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
                  bottom: value ? 0.0 : -kToolbarHeight * 1.5,
                  duration: const Duration(milliseconds: 300),
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

class _ShoesSizeItem extends StatelessWidget {
  final String text;

  const _ShoesSizeItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        '$text mm',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11.0,
        ),
      ),
    );
  }
}
