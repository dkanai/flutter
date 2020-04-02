import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/animal/animal.dart';

class TestHelper {
  void mockGetSharedPreference(List<Animal> value) {
    const MethodChannel('plugins.flutter.io/shared_preferences').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{'flutter.animals': jsonEncode(value)};
      }
      return null;
    });
  }

  Widget createWithMaterial(child) {
    return MaterialApp(
      home: child,
    );
  }

  Widget createWithMaterialScaffold(child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}
