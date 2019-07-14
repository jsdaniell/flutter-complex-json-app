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

  BuiltList<Property> get listings;

  Response._();
  factory Response([updates(ResponseBuilder b)]) = _$Response;
}

// Property Class / Used for create the serializer
// Here is defined the data that will be getted for modeling the list and after the response serialized.

abstract class Property implements Built<Property, PropertyBuilder> {
  static Serializer<Property> get serializer => _$propertySerializer;

  String get title;
  String get summary;

  Property._();
  factory Property([updates(PropertyBuilder b)]) = _$Property;
}
