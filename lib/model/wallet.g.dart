// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletAdapter extends TypeAdapter<Wallet> {
  @override
  final int typeId = 0;

  @override
  Wallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wallet(
      mnemonic: (fields[0] as List)?.cast<String>(),
      secret: fields[1] as String,
      amount: fields[2] as String,
      pkh: fields[3] as String,
      password: fields[4] as String,
      email: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Wallet obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mnemonic)
      ..writeByte(1)
      ..write(obj.secret)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.pkh)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
