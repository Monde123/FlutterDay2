// gift.dart
import 'package:flutter/widgets.dart';

class Gift extends StatefulWidget {
  const Gift({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Gift();
  }
}

class _Gift extends State {
  @override
  Widget build(BuildContext context) {
    return Center(child:  Text('Gift Page'),);
  }
}
