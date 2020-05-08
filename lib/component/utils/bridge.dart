import 'package:flutter/services.dart';

// flutter端调用native端
class Bridge {

  //MethodChannel通信,flutter端调用native端
  static MethodChannel methodChannel = MethodChannel('com.example.mix_flutter/bridge');
}