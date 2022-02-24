import 'package:flutter/cupertino.dart';
import 'package:flutter_api_integration/models/countries_list_model.dart';
import 'package:flutter_api_integration/models/country_details_model.dart';
import 'package:flutter_api_integration/services/api_services.dart';

class HomeProvider extends ChangeNotifier{
  var isLoading = true;
  List<CountriesListModel> countriesList=[];
  List<CountriesListModel> filteredCountriesList=[];

  CountryDetailsModel? countryDetailsModel;


  HomeProvider(){
    fetchCountries();
  }


  void fetchCountries() async {
      var countriesT = await ApiServices().getCountries();

      countriesT.data.forEach((key, value) {
        countriesList.add(CountriesListModel(key,value.country));
        filteredCountriesList.add(CountriesListModel(key,value.country));
        notifyListeners();

      });




    notifyListeners();
  }

  void filterCountries(String value) {
    filteredCountriesList = countriesList
        .where((element) => element.country.toLowerCase()
        .contains(
        value.toLowerCase()))
        .toList();
    notifyListeners();

  }

  getCountryDetails(String country) async {
    countryDetailsModel=null;
    countryDetailsModel=await ApiServices().getCountryDetails(country);
    notifyListeners();

  }

}