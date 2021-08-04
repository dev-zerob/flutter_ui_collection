import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Icon(Icons.home),
          ),
          Expanded(
            child: Icon(Icons.search),
          ),
          Expanded(
            child: Icon(Icons.favorite_border),
          ),
          Expanded(
            child: Icon(Icons.shopping_cart),
          ),
          Expanded(
            child: Center(
              child: CircleAvatar(
                radius: 13.0,
                backgroundImage: AssetImage('assets/common/images/profile_image.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
