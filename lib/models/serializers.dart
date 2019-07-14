import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'nestoria.dart';

part 'serializers.g.dart';

// Parsing data happen here, after property_scoped_model handle all the data from the response.

@SerializersFor(const [
  Nestoria,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
