// utilisateur/users.g.dart
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
      fields[0] as String,
      fields[1] as double,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Utilisateur obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.solde)
      ..writeByte(2)
      ..write(obj.usersProfil)
      ..writeByte(3)
      ..write(obj.mail);
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
