import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'restaurant_record.g.dart';

abstract class RestaurantRecord
    implements Built<RestaurantRecord, RestaurantRecordBuilder> {
  static Serializer<RestaurantRecord> get serializer =>
      _$restaurantRecordSerializer;

  @BuiltValueField(wireName: 'Name')
  String? get name;

  @BuiltValueField(wireName: 'PlaceID')
  String? get placeID;

  @BuiltValueField(wireName: 'WheelChairTag')
  int? get wheelChairTag;

  @BuiltValueField(wireName: 'BlindFriendlyTag')
  int? get blindFriendlyTag;

  @BuiltValueField(wireName: 'SignLanguage')
  int? get signLanguage;

  @BuiltValueField(wireName: 'WheelChairAccessbileEntrance')
  bool? get wheelChairAccessbileEntrance;

  String? get imageref;

  int? get price;

  double? get rating;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RestaurantRecordBuilder builder) => builder
    ..name = ''
    ..placeID = ''
    ..wheelChairTag = 0
    ..blindFriendlyTag = 0
    ..signLanguage = 0
    ..wheelChairAccessbileEntrance = false
    ..imageref = ''
    ..price = 0
    ..rating = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Restaurant');

  static Stream<RestaurantRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RestaurantRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RestaurantRecord._();
  factory RestaurantRecord([void Function(RestaurantRecordBuilder) updates]) =
      _$RestaurantRecord;

  static RestaurantRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRestaurantRecordData({
  String? name,
  String? placeID,
  int? wheelChairTag,
  int? blindFriendlyTag,
  int? signLanguage,
  bool? wheelChairAccessbileEntrance,
  String? imageref,
  int? price,
  double? rating,
}) {
  final firestoreData = serializers.toFirestore(
    RestaurantRecord.serializer,
    RestaurantRecord(
      (r) => r
        ..name = name
        ..placeID = placeID
        ..wheelChairTag = wheelChairTag
        ..blindFriendlyTag = blindFriendlyTag
        ..signLanguage = signLanguage
        ..wheelChairAccessbileEntrance = wheelChairAccessbileEntrance
        ..imageref = imageref
        ..price = price
        ..rating = rating,
    ),
  );

  return firestoreData;
}
