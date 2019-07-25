import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'nestoria.g.dart';

// Here is defined the types and properties that will be the models.

// This is the origim file to generate code for serializing.
// ins't importing JSON yet, but it's constructed based on his data.

// Nestoria Class / Used for create the serializer
// The type Response have a variable to handle the response.

abstract class Nestoria implements Built<Nestoria, NestoriaBuilder> {
  static Serializer<Nestoria> get serializer => _$nestoriaSerializer;

  Response get response;

  Nestoria._();
  factory Nestoria([updates(NestoriaBuilder b)]) = _$Nestoria;
}

// Response Class / Used for create the serializer
// Here a BuiltList is constructed for handle a bunch of Property type on a listing (listings).

abstract class Response implements Built<Response, ResponseBuilder> {
  static Serializer<Response> get serializer => _$responseSerializer;

  @nullable
  BuiltList<Property> get listings;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  int get page;

  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  Response._();
  factory Response([updates(ResponseBuilder b)]) = _$Response;
}

// Property Class / Used for create the serializer
// Here is defined the data that will be getted for modeling the list and after the response serialized.
// @BuiltValueField notation is used to get the information in a camelCase variable.

// Importing this property, will allow acess to data.

abstract class Property implements Built<Property, PropertyBuilder> {
  static Serializer<Property> get serializer => _$propertySerializer;

  String get title;

  String get summary;

  @BuiltValueField(wireName: 'thumb_url')
  String get thumbUrl;

  @BuiltValueField(wireName: 'img_url')
  String get imgUrl;

  @nullable
  @BuiltValueField(wireName: 'bathroom_number')
  int get bathroomNumber;

  @nullable
  @BuiltValueField(wireName: 'bedroom_number')
  int get bedroomNumber;

  @BuiltValueField(wireName: 'car_spaces')
  int get carSpaces;

  @BuiltValueField(wireName: 'price_formatted')
  String get priceFormatted;

  @nullable
  @BuiltValueField(wireName: 'property_type')
  String get propertyType;

  @nullable
  String get keywords;

  // @memoized
  // BuiltList<String> get keyWordList => BuiltList<String>(keywords.split(", "));

  @nullable
  @BuiltValueField(wireName: 'lister_name')
  String get listerName;

  @nullable
  @BuiltValueField(wireName: 'lister_url')
  String get listerUrl;

  @nullable
  @BuiltValueField(wireName: 'datasource_name')
  String get datasourceName;

  @nullable
  @BuiltValueField(wireName: 'updated_in_days')
  int get updatedDays;

  Property._();
  factory Property([updates(PropertyBuilder b)]) = _$Property;
}
