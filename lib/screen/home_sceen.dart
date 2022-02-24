import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_integration/providers/home_provider.dart';
import 'package:provider/provider.dart';

import 'country_details_screen.dart';
class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider=Provider.of<HomeProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60.0,
        title:  TextField(
          decoration: const InputDecoration(
              hintText: " Search...",
              border: InputBorder.none,
              suffixIcon: Icon(Icons.search,color: Colors.black,)),
          onChanged: (value){
            homeProvider.filterCountries(value);
          },
          style: const TextStyle(color: Colors.black, fontSize: 15.0),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: SafeArea(

          child: Consumer<HomeProvider>(
            builder: (context,value,child) {
              if(value.countriesList.isNotEmpty){
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: value.filteredCountriesList.length,
                    itemBuilder:
                        (BuildContext context, int index) {
                      var item = value.filteredCountriesList[index];

                      return InkWell(
                        onTap: (){
                          homeProvider.getCountryDetails(item.key);

                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  CountryDetailsScreen(index: index,)));

                        },
                        child: Card(
                          elevation:1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal:10,vertical: 3),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    padding: const EdgeInsets.symmetric(horizontal:5,vertical: 10),

                                    child: Text(item.key,
                                      style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    width: 1,
                                    color: Colors.grey,
                                    thickness: 3,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                                      child: Text(item.country,
                                        style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });

              }else{
                return Container(
                    color: Colors.white,
                    child: const Center(child: CircularProgressIndicator()));

              }
            }
          ),
        ),
      ),
    );
  }


}

