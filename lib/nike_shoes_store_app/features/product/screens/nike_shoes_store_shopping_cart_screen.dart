import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/models/nike_shoes.dart';

const Size _buttonSize = const Size(160.0, 60.0);
const double _buttonCircularSize = 60.0;
const double _miniImageSize = 40.0;
const double _originalImageSize = 150.0;

class NikeShoesStoreShoppingCartScreen extends StatefulWidget {
  final NikeShoes nikeShoes;

  const NikeShoesStoreShoppingCartScreen({
    Key? key,
    required this.nikeShoes,
  }) : super(key: key);

  @override
  _NikeShoesStoreShoppingCartScreenState createState() => _NikeShoesStoreShoppingCartScreenState();
}

class _NikeShoesStoreShoppingCartScreenState extends State<NikeShoesStoreShoppingCartScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animationResize;
  late final Animation _animationMovementIn;
  late final Animation _animationMovementOut;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animationResize = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.3),
      ),
    );
    _animationMovementIn = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.35, 0.6, curve: Curves.fastLinearToSlowEaseIn),
      ),
    );
    _animationMovementOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.elasticIn),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPanel(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double currentImageSize = (_originalImageSize * _animationResize.value).clamp(_miniImageSize, _originalImageSize);

    return TweenAnimationBuilder<double>(
      child: Container(
        width: (size.width * _animationResize.value).clamp(
          _buttonCircularSize,
          size.width,
        ),
        height: (size.height * 0.6 * _animationResize.value).clamp(
          _buttonCircularSize,
          size.height * 0.6,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0),
            bottomLeft: _animationResize.value == 1 ? Radius.zero : Radius.circular(30.0),
            bottomRight: _animationResize.value == 1 ? Radius.zero : Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: _animationResize.value == 1 ? MainAxisAlignment.start : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.nikeShoes.images.first,
                    height: currentImageSize,
                  ),
                  if (_animationResize.value == 1) ...[
                    const SizedBox(width: 20.0),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.nikeShoes.model,
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          '${widget.nikeShoes.discountedPrice.toString()} 원',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            value * size.height * 0.6,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final Size buttonSize = Size(
            (_buttonSize.width * _animationResize.value).clamp(
              _buttonCircularSize,
              _buttonSize.width,
            ),
            (_buttonSize.height * _animationResize.value).clamp(
              _buttonCircularSize,
              _buttonSize.height,
            ),
          );

          final Size panelSize = Size(
            (size.width * _animationResize.value).clamp(
              _buttonCircularSize,
              size.width,
            ),
            (size.height * _animationResize.value).clamp(
              _buttonCircularSize,
              size.height,
            ),
          );

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(color: Colors.black87),
                ),
              ),
              Positioned.fill(
                child: Stack(
                  children: <Widget>[
                    if (_animationMovementIn.value != 1)
                      Positioned(
                        top: size.height * 0.4 + (_animationMovementIn.value * size.height * 0.45),
                        left: size.width / 2.0 - panelSize.width / 2.0,
                        width: panelSize.width,
                        child: _buildPanel(context),
                      ),
                    Positioned(
                      bottom: 40.0 - (_animationMovementOut.value * 100),
                      left: size.width / 2.0 - buttonSize.width / 2.0,
                      child: TweenAnimationBuilder<double>(
                        child: InkWell(
                          onTap: () {
                            _controller.forward();
                          },
                          child: Container(
                            width: buttonSize.width,
                            height: buttonSize.height,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(const Radius.circular(30.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  if (_animationResize.value == 1) ...[
                                    const SizedBox(width: 10.0),
                                    Text(
                                      'ADD TO CART',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                        tween: Tween(begin: 1.0, end: 0.0),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(
                              0.0,
                              value * size.height * 0.6,
                            ),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
