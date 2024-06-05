import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ShopHomeModel {
  
  Future<void> carzino() async {
    var box = await Hive.openBox('product_box');
    
  }
}

class ShopHomeModelProvider extends InheritedWidget {
  final ShopHomeModel model;
  const ShopHomeModelProvider(
      {super.key, required super.child, required this.model});

  static watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShopHomeModelProvider>();
  }

  static read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ShopHomeModelProvider>()
        ?.widget;
    return widget is ShopHomeModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // ignore: unrelated_type_equality_checks
    return model != oldWidget;
  }
}
