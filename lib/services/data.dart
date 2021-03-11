import 'dart:convert' as convert;

import 'package:http/http.dart';
import 'package:spacex_api/models/company/company.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_api/utils.dart';

class Data {
  final api = SpaceXApi();
  Company _company;
  Company _launches;

  // Future<int> getCardsToShow() async {

  // }

  Future<Company> getCompanyData() async {
    if (_company == null) {
      Response response = await api.getCompany();
      final json = Utils.parseResponseAsJson(response);
      _company = Company.fromJson(json);
    }
    return _company;
  }

  Future<Company> getLaunchesData() async {
    if (_launches == null) {
      Response response = await api.getAllLaunches();
      final json = Utils.parseResponseAsJson(response);
      _launches = Company.fromJson(json);
    }
    return _launches;
  }
}
