// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UtilisateurAdapter extends TypeAdapter<Utilisateur> {
  @override
  final int typeId = 1;

  @override
  Utilisateur read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Utilisateur(
      nom: fields[0] as String,
      solde: fields[1] as double,
      usersProfil: fields[2] as String,
      mail: fields[3] as String,
    )..compteUsers = fields[6] as int;
  }

  @override
  void write(BinaryWriter writer, Utilisateur obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.solde)
      ..writeByte(2)
      ..write(obj.usersProfil)
      ..writeByte(3)
      ..write(obj.mail)
      ..writeByte(6)
      ..write(obj.compteUsers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UtilisateurAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
