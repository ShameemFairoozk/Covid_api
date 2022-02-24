import 'dart:convert';

import 'package:flutter_api_integration/%20constant/string.dart';
import 'package:flutter_api_integration/models/country_details_model.dart';
import 'package:flutter_api_integration/models/country_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  var client=http.Client();


  Future<CountryModel> getCountries() async {
    var countryModel;

    try {
      var response = await client.get(Uri.parse(countriesUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        countryModel = CountryModel.fromJson(jsonMap);
        return countryModel;


      }
    } catch (e) {
      return countryModel;
    }

    return countryModel;
  }

  Future<CountryDetailsModel>?  getCountryDetails(String country) async {
    var countryDetailModel;

    try {
      var response = await client.get(Uri.parse(countryDetails+country));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        countryDetailModel = CountryDetailsModel.fromJson(jsonMap);
        return countryDetailModel;


      }
    } catch (e) {
      print(e);
      return countryDetailModel;
    }

    return countryDetailModel;
  }


}