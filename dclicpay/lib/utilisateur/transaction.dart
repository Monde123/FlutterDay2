// utilisateur/transaction.dart
/*import 'package:dclicpay/utilisateur/users.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class transaction extends Utilisateur {
 
  @HiveField(1)
  double  depense;

  @HiveField(2)
  double recettes;

 

  transaction( this.depense,this.recettes):super
}

class UtilisateurBase {
  static Box<Utilisateur>? usersBox;

  static Future<void> init() async {
    usersBox = await Hive.openBox<Utilisateur>('utilisateurs');
    if (usersBox!.isEmpty) {
      var utilisateur1 = Utilisateur(
        'Moïse',
        1000.0,
        'assets/Mask Group.png',
        'moise@gmail.com',
      );
      var utilisateur2 = Utilisateur(
        'Marie',
        500.00,
        'assets/Mask1.png',
        'marie@gmail.com',
      );
      await usersBox!.put(utilisateur1.mail, utilisateur1);
      await usersBox!.put(utilisateur2.mail, utilisateur2);
    }
  }

  static Utilisateur? getUtilisateur(String email) {
    return usersBox?.get(email);
  }

  static List<Utilisateur> getTousLesUtilisateurs() {
    return usersBox?.values.toList() ?? [];
  }
}*/
