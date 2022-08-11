import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:subway/subway_view_model.dart';


class SubwayApi {
  SubwayApi() {
    fetchSubways('');
  }

  final _subwayStreamController = StreamController<List<SubwayModel>>();

  Stream<List<SubwayModel>> get subwayStream => _subwayStreamController.stream;

  Future fetchSubways(String query) async {
    List<SubwayModel> subwayLists = await getSubways(query);
    _subwayStreamController.add(subwayLists);
  }

  Future<List<SubwayModel>> getSubways(String query) async {
    Uri url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$query');

    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    List<dynamic> hits = json['realtimeArrivalList'];
    return hits.map((e) => SubwayModel.fromJson(e)).toList();
  }
}

