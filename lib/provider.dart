import 'package:flutter/material.dart';
import 'package:subway/subway_api.dart';
import 'package:subway/subway_view_model.dart';

class SubwayScreenViewModel extends ChangeNotifier {
  final _subwayApi = SubwayApi();

  List<SubwayModel> modelList = [];

  void fetchArrivalLists(String query) async {
    modelList = await _subwayApi.getSubways(query);
    notifyListeners();
  }
}