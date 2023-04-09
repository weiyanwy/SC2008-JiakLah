import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reviews_record.g.dart';

abstract class ReviewsRecord
    implements Built<ReviewsRecord, ReviewsRecordBuilder> {
  static Serializer<ReviewsRecord> get serializer => _$reviewsRecordSerializer;

  @BuiltValueField(wireName: 'Review')
  String? get review;

  @BuiltValueField(wireName: 'UserID')
  String? get userID;

  @BuiltValueField(wireName: 'PlaceID')
  String? get placeID;

  @BuiltValueField(wireName: 'Rating')
  double? get rating;

  @BuiltValueField(wireName: 'PlaceName')
  String? get placeName;

  @BuiltValueField(wireName: 'WheelChair')
  int? get wheelChair;

  @BuiltValueField(wireName: 'BlindFriendly')
  int? get blindFriendly;

  @BuiltValueField(wireName: 'SignLanguage')
  int? get signLanguage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReviewsRecordBuilder builder) => builder
    ..review = ''
    ..userID = ''
    ..placeID = ''
    ..rating = 0.0
    ..placeName = ''
    ..wheelChair = 0
    ..blindFriendly = 0
    ..signLanguage = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReviewsRecord._();
  factory ReviewsRecord([void Function(ReviewsRecordBuilder) updates]) =
      _$ReviewsRecord;

  static ReviewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReviewsRecordData({
  String? review,
  String? userID,
  String? placeID,
  double? rating,
  String? placeName,
  int? wheelChair,
  int? blindFriendly,
  int? signLanguage,
}) {
  final firestoreData = serializers.toFirestore(
    ReviewsRecord.serializer,
    ReviewsRecord(
      (r) => r
        ..review = review
        ..userID = userID
        ..placeID = placeID
        ..rating = rating
        ..placeName = placeName
        ..wheelChair = wheelChair
        ..blindFriendly = blindFriendly
        ..signLanguage = signLanguage,
    ),
  );

  return firestoreData;
}
