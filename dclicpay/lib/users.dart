// users.dart
class Utilisateur {
  Utilisateur(this.nom, this.solde, this.usersProfil);
  //Attributs
  String nom;
  double solde;
  String usersProfil;
  //méthodes
  recevoir(int montant) {
    solde = solde + montant;
    return solde;
  }

  envoyer(int mont) {
    solde = solde + mont;
    return solde;
  }
}
