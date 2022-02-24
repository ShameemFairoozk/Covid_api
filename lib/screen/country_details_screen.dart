import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_integration/%20constant/text_style.dart';
import 'package:flutter_api_integration/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'home_sceen.dart';

class CountryDetailsScreen extends StatelessWidget {
  int index;

  CountryDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var height = queryData.size.height;
    var width = queryData.size.width;
    return Consumer<HomeProvider>(builder: (context, value, child) {
      if (value.countryDetailsModel != null) {
        return GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              if (index > 0) {
                homeProvider.getCountryDetails(
                    value.filteredCountriesList[index - 1].key);
                Navigator.of(context).push(SecondPageRoute(index - 1));
              }
            }

            if (details.delta.dx < 0) {
              if (index < value.filteredCountriesList.length) {
                homeProvider.getCountryDetails(
                    value.filteredCountriesList[index + 1].key);
                Navigator.of(context).push(SecondPageRoute(index + 1));
              }
            }
          },
          child: Scaffold(
            appBar: AppBar(
              leading:  BackButton(color: Colors.white,onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));

              }),
              title: Text(
                value.countryDetailsModel!.country,
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Colors.white),
              ),
              backgroundColor: const Color(0XFF473e97),
              elevation: 0,
            ),
            backgroundColor: const Color(0XFF473e97),
            body: WillPopScope(
              onWillPop: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
                return false;
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: const Text(
                          '<<< Swipe >>>',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',

                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Container(
                              height: height / 4,
                              width: double.infinity,
                              margin: const EdgeInsets.all(20),
                              child: Image.network(
                                value.countryDetailsModel!.countryInfo.flag,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: height / 8,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0XFFff9700),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cases',
                                        style: white15,
                                      ),
                                      Text(
                                        value.countryDetailsModel!.cases
                                            .toString(),
                                        style: white20,
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  height: height / 8,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0XFFf44236),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Today Cases',
                                        style: white15,
                                      ),
                                      Text(
                                        value.countryDetailsModel!.todayCases
                                            .toString(),
                                        style: white20,
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: height / 8,
                                  decoration: BoxDecoration(
                                      color: const Color(0XFF4cb050),
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Recovered',
                                        style: white15,
                                      ),
                                      Text(
                                        value.countryDetailsModel!.recovered
                                            .toString(),
                                        style: white20,
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  height: height / 8,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0XFF01aaf4),
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Active',
                                        style: white15,
                                      ),
                                      Text(
                                        value.countryDetailsModel!.active
                                            .toString(),
                                        style: white20,
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  height: height / 8,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0XFF9c28b1),
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Critical',
                                        style: white15,
                                      ),
                                      Text(
                                        value.countryDetailsModel!.critical
                                            .toString(),
                                        style: white20,
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            list('Deaths : ',
                                value.countryDetailsModel!.deaths.toString()),
                            list(
                                'Today Deaths : ',
                                value.countryDetailsModel!.todayDeaths
                                    .toString()),
                            list(
                                'Today Recovered : ',
                                value.countryDetailsModel!.todayRecovered
                                    .toString()),
                            list(
                                'Cases Per One Million : ',
                                value.countryDetailsModel!.casesPerOneMillion
                                    .toString()),
                            list(
                                'Deaths Per One Million : ',
                                value.countryDetailsModel!.deathsPerOneMillion
                                    .toString()),
                            list('Tests : ',
                                value.countryDetailsModel!.tests.toString()),
                            list(
                                'Tests Per One Million : ',
                                value.countryDetailsModel!.testsPerOneMillion
                                    .toString()),
                            list('Population : ',
                                value.countryDetailsModel!.population.toString()),
                            list(
                                'One Case Per People : ',
                                value.countryDetailsModel!.oneCasePerPeople
                                    .toString()),
                            list(
                                'One Death Per People : ',
                                value.countryDetailsModel!.oneDeathPerPeople
                                    .toString()),
                            list(
                                'One Test Per People : ',
                                value.countryDetailsModel!.oneDeathPerPeople
                                    .toString()),
                            list(
                                'Recovered Per One Million : ',
                                value.countryDetailsModel!.oneDeathPerPeople
                                    .toString()),
                            list(
                                'Critical Per One Million : ',
                                value.countryDetailsModel!.oneDeathPerPeople
                                    .toString()),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()));
      }
    });
  }

  Widget list(String txt1, String txt2) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              Text(
                txt1,
                style: black18,
              ),
              Text(
                txt2,
                style: red18,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
        )
      ],
    );
  }
}

class SecondPageRoute extends CupertinoPageRoute {
  int index;

  SecondPageRoute(this.index)
      : super(
            builder: (BuildContext context) => CountryDetailsScreen(
                  index: index,
                ));

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
        opacity: animation,
        child: CountryDetailsScreen(
          index: index,
        ));
  }
}
