import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void pop() {
    Navigator.pop(this);
  }
}
