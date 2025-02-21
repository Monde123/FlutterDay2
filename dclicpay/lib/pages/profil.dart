// profil.dart
import 'package:flutter/widgets.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilPage();
  }
}

class _ProfilPage extends State {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profil Page'));
  }
}
