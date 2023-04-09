// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReviewsRecord> _$reviewsRecordSerializer =
    new _$ReviewsRecordSerializer();

class _$ReviewsRecordSerializer implements StructuredSerializer<ReviewsRecord> {
  @override
  final Iterable<Type> types = const [ReviewsRecord, _$ReviewsRecord];
  @override
  final String wireName = 'ReviewsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReviewsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.review;
    if (value != null) {
      result
        ..add('Review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userID;
    if (value != null) {
      result
        ..add('UserID')
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
    value = object.rating;
    if (value != null) {
      result
        ..add('Rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.placeName;
    if (value != null) {
      result
        ..add('PlaceName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wheelChair;
    if (value != null) {
      result
        ..add('WheelChair')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.blindFriendly;
    if (value != null) {
      result
        ..add('BlindFriendly')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.signLanguage;
    if (value != null) {
      result
        ..add('SignLanguage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ReviewsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReviewsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'UserID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'PlaceID':
          result.placeID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'PlaceName':
          result.placeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'WheelChair':
          result.wheelChair = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'BlindFriendly':
          result.blindFriendly = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'SignLanguage':
          result.signLanguage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ReviewsRecord extends ReviewsRecord {
  @override
  final String? review;
  @override
  final String? userID;
  @override
  final String? placeID;
  @override
  final double? rating;
  @override
  final String? placeName;
  @override
  final int? wheelChair;
  @override
  final int? blindFriendly;
  @override
  final int? signLanguage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReviewsRecord([void Function(ReviewsRecordBuilder)? updates]) =>
      (new ReviewsRecordBuilder()..update(updates))._build();

  _$ReviewsRecord._(
      {this.review,
      this.userID,
      this.placeID,
      this.rating,
      this.placeName,
      this.wheelChair,
      this.blindFriendly,
      this.signLanguage,
      this.ffRef})
      : super._();

  @override
  ReviewsRecord rebuild(void Function(ReviewsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewsRecordBuilder toBuilder() => new ReviewsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewsRecord &&
        review == other.review &&
        userID == other.userID &&
        placeID == other.placeID &&
        rating == other.rating &&
        placeName == other.placeName &&
        wheelChair == other.wheelChair &&
        blindFriendly == other.blindFriendly &&
        signLanguage == other.signLanguage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, userID.hashCode);
    _$hash = $jc(_$hash, placeID.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, placeName.hashCode);
    _$hash = $jc(_$hash, wheelChair.hashCode);
    _$hash = $jc(_$hash, blindFriendly.hashCode);
    _$hash = $jc(_$hash, signLanguage.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewsRecord')
          ..add('review', review)
          ..add('userID', userID)
          ..add('placeID', placeID)
          ..add('rating', rating)
          ..add('placeName', placeName)
          ..add('wheelChair', wheelChair)
          ..add('blindFriendly', blindFriendly)
          ..add('signLanguage', signLanguage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReviewsRecordBuilder
    implements Builder<ReviewsRecord, ReviewsRecordBuilder> {
  _$ReviewsRecord? _$v;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  String? _userID;
  String? get userID => _$this._userID;
  set userID(String? userID) => _$this._userID = userID;

  String? _placeID;
  String? get placeID => _$this._placeID;
  set placeID(String? placeID) => _$this._placeID = placeID;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  String? _placeName;
  String? get placeName => _$this._placeName;
  set placeName(String? placeName) => _$this._placeName = placeName;

  int? _wheelChair;
  int? get wheelChair => _$this._wheelChair;
  set wheelChair(int? wheelChair) => _$this._wheelChair = wheelChair;

  int? _blindFriendly;
  int? get blindFriendly => _$this._blindFriendly;
  set blindFriendly(int? blindFriendly) =>
      _$this._blindFriendly = blindFriendly;

  int? _signLanguage;
  int? get signLanguage => _$this._signLanguage;
  set signLanguage(int? signLanguage) => _$this._signLanguage = signLanguage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReviewsRecordBuilder() {
    ReviewsRecord._initializeBuilder(this);
  }

  ReviewsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _review = $v.review;
      _userID = $v.userID;
      _placeID = $v.placeID;
      _rating = $v.rating;
      _placeName = $v.placeName;
      _wheelChair = $v.wheelChair;
      _blindFriendly = $v.blindFriendly;
      _signLanguage = $v.signLanguage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReviewsRecord;
  }

  @override
  void update(void Function(ReviewsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewsRecord build() => _build();

  _$ReviewsRecord _build() {
    final _$result = _$v ??
        new _$ReviewsRecord._(
            review: review,
            userID: userID,
            placeID: placeID,
            rating: rating,
            placeName: placeName,
            wheelChair: wheelChair,
            blindFriendly: blindFriendly,
            signLanguage: signLanguage,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
