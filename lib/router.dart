import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:mix_flutter/page/index/index.dart';
import 'package:mix_flutter/component/utils/constant.dart';

import 'component/utils/bridge.dart';

class Router extends StatefulWidget {
  Router();

  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  Map _routerConfigMap;

  @override
  void initState() {
    if (Platform.isAndroid) {
      //Android主动向native端请求路由相关数据
      getRouterFromAndroid();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return createPageWidget();
  }

  Widget createPageWidget() {
    String routerKey;
    if (_routerConfigMap != null) {
      routerKey = _routerConfigMap[Constant.ROUTER_KEY];
    }
    print('bright1#router#routerKey: $routerKey');
    switch (routerKey) {
      case 'home':
        return HomePage();
      default:
        return Container(
          child: Text('11111111111'),
        );
    }
  }

  Future<void> getRouterFromAndroid() async {
    try {
      Map result =
          await Bridge.methodChannel.invokeMapMethod('getRouterFromNative');
      if (result != null) {
        setState(() {
          _routerConfigMap = result;
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
