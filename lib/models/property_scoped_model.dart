import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'nestoria.dart';
import 'dart:convert';
import 'dart:async';
import 'serializers.dart';

// JSON Data is requested here, and alocated on model.
// Model Scoped Module allows that all widgets share the same state of data model.

class PropertyScopedModel extends Model {
  // Handling JSON Data

  List<Property> _properties = [];
  List<Property> get properties => _properties;

  // Variable to be used to store the information that is loadind, can be used with loading widgets.

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Getting JSON Data

  Future<dynamic> _getData(String place) async {
    String uri =
        "https://api.nestoria.co.uk/api?encoding=json&pretty=1&action=search_listings&country=uk&listing_type=buy&place_name=$place";

    var res = await http.get(Uri.encodeFull(uri));

    return json.decode(res.body);
  }

  // Serializing Data Requested with previous maded Serializer (./nestoria.dart).

  Future getProperties(String place) async {
    _isLoading = true;

    var responseData = await _getData(place);

    Nestoria nestoria =
        serializers.deserializeWith(Nestoria.serializer, responseData);

    _properties =
        nestoria.response.listings.map((property) => property).toList();

    _isLoading = false;

    notifyListeners();
  }
}
