// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RestaurantRecord> _$restaurantRecordSerializer =
    new _$RestaurantRecordSerializer();

class _$RestaurantRecordSerializer
    implements StructuredSerializer<RestaurantRecord> {
  @override
  final Iterable<Type> types = const [RestaurantRecord, _$RestaurantRecord];
  @override
  final String wireName = 'RestaurantRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RestaurantRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placeID;
    if (value != null) {
      result
        ..add('PlaceID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wheelChairTag;
    if (value != null) {
      result
        ..add('WheelChairTag')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.blindFriendlyTag;
    if (value != null) {
      result
        ..add('BlindFriendlyTag')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.signLanguage;
    if (value != null) {
      result
        ..add('SignLanguage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.wheelChairAccessbileEntrance;
    if (value != null) {
      result
        ..add('WheelChairAccessbileEntrance')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.imageref;
    if (value != null) {
      result
        ..add('imageref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RestaurantRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestaurantRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'PlaceID':
          result.placeID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'WheelChairTag':
          result.wheelChairTag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'BlindFriendlyTag':
          result.blindFriendlyTag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'SignLanguage':
          result.signLanguage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'WheelChairAccessbileEntrance':
          result.wheelChairAccessbileEntrance = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'imageref':
          result.imageref = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RestaurantRecord extends RestaurantRecord {
  @override
  final String? name;
  @override
  final String? placeID;
  @override
  final int? wheelChairTag;
  @override
  final int? blindFriendlyTag;
  @override
  final int? signLanguage;
  @override
  final bool? wheelChairAccessbileEntrance;
  @override
  final String? imageref;
  @override
  final int? price;
  @override
  final double? rating;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RestaurantRecord(
          [void Function(RestaurantRecordBuilder)? updates]) =>
      (new RestaurantRecordBuilder()..update(updates))._build();

  _$RestaurantRecord._(
      {this.name,
      this.placeID,
      this.wheelChairTag,
      this.blindFriendlyTag,
      this.signLanguage,
      this.wheelChairAccessbileEntrance,
      this.imageref,
      this.price,
      this.rating,
      this.ffRef})
      : super._();

  @override
  RestaurantRecord rebuild(void Function(RestaurantRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestaurantRecordBuilder toBuilder() =>
      new RestaurantRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestaurantRecord &&
        name == other.name &&
        placeID == other.placeID &&
        wheelChairTag == other.wheelChairTag &&
        blindFriendlyTag == other.blindFriendlyTag &&
        signLanguage == other.signLanguage &&
        wheelChairAccessbileEntrance == other.wheelChairAccessbileEntrance &&
        imageref == other.imageref &&
        price == other.price &&
        rating == other.rating &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, placeID.hashCode);
    _$hash = $jc(_$hash, wheelChairTag.hashCode);
    _$hash = $jc(_$hash, blindFriendlyTag.hashCode);
    _$hash = $jc(_$hash, signLanguage.hashCode);
    _$hash = $jc(_$hash, wheelChairAccessbileEntrance.hashCode);
    _$hash = $jc(_$hash, imageref.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RestaurantRecord')
          ..add('name', name)
          ..add('placeID', placeID)
          ..add('wheelChairTag', wheelChairTag)
          ..add('blindFriendlyTag', blindFriendlyTag)
          ..add('signLanguage', signLanguage)
          ..add('wheelChairAccessbileEntrance', wheelChairAccessbileEntrance)
          ..add('imageref', imageref)
          ..add('price', price)
          ..add('rating', rating)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RestaurantRecordBuilder
    implements Builder<RestaurantRecord, RestaurantRecordBuilder> {
  _$RestaurantRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _placeID;
  String? get placeID => _$this._placeID;
  set placeID(String? placeID) => _$this._placeID = placeID;

  int? _wheelChairTag;
  int? get wheelChairTag => _$this._wheelChairTag;
  set wheelChairTag(int? wheelChairTag) =>
      _$this._wheelChairTag = wheelChairTag;

  int? _blindFriendlyTag;
  int? get blindFriendlyTag => _$this._blindFriendlyTag;
  set blindFriendlyTag(int? blindFriendlyTag) =>
      _$this._blindFriendlyTag = blindFriendlyTag;

  int? _signLanguage;
  int? get signLanguage => _$this._signLanguage;
  set signLanguage(int? signLanguage) => _$this._signLanguage = signLanguage;

  bool? _wheelChairAccessbileEntrance;
  bool? get wheelChairAccessbileEntrance =>
      _$this._wheelChairAccessbileEntrance;
  set wheelChairAccessbileEntrance(bool? wheelChairAccessbileEntrance) =>
      _$this._wheelChairAccessbileEntrance = wheelChairAccessbileEntrance;

  String? _imageref;
  String? get imageref => _$this._imageref;
  set imageref(String? imageref) => _$this._imageref = imageref;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RestaurantRecordBuilder() {
    RestaurantRecord._initializeBuilder(this);
  }

  RestaurantRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _placeID = $v.placeID;
      _wheelChairTag = $v.wheelChairTag;
      _blindFriendlyTag = $v.blindFriendlyTag;
      _signLanguage = $v.signLanguage;
      _wheelChairAccessbileEntrance = $v.wheelChairAccessbileEntrance;
      _imageref = $v.imageref;
      _price = $v.price;
      _rating = $v.rating;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestaurantRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RestaurantRecord;
  }

  @override
  void update(void Function(RestaurantRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RestaurantRecord build() => _build();

  _$RestaurantRecord _build() {
    final _$result = _$v ??
        new _$RestaurantRecord._(
            name: name,
            placeID: placeID,
            wheelChairTag: wheelChairTag,
            blindFriendlyTag: blindFriendlyTag,
            signLanguage: signLanguage,
            wheelChairAccessbileEntrance: wheelChairAccessbileEntrance,
            imageref: imageref,
            price: price,
            rating: rating,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
