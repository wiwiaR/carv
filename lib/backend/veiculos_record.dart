import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

abstract class VeiculosRecord
    implements Built<VeiculosRecord, VeiculosRecorduilder> {
  String? get placa;
}

Serializer<VeiculosRecord> _$veiculosRecordSerializer =
    new _$VeiculosRecordSerializer();

class _$VeiculosRecordSerializer {
  final Iterable<Type> types = const [VeiculosRecord, _$VeiculosRecord];
  final String wireName = 'VeiculosRecord';

  Iterable<Object?> serialize(Serializers serializers, VeiculosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.placa;
    if (value != null) {
      result
        ..add('placa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
  }
}
