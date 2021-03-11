import 'package:flutter/material.dart';
import 'package:flutter_spacex_app/DUMMY_DATA.dart';
import 'package:flutter_spacex_app/screens/base_screen.dart';
import 'package:intl/intl.dart';
import 'package:spacex_api/models/company/company.dart';

class HomeScreen extends BaseScreen {
  final _company = Company.fromJson(DUMMY_COMPANY);
  final List<String> _cardsList = [
    'capsules',
    "company",
    "crew",
    "dragons",
    "history",
    "launches",
    "launchpads",
    "landpads",
    "payloads",
    "roadster",
    "rockets",
    "ships",
    "starlink"
  ];

  @override
  String appBarTitle() {
    return "Home Screen";
  }

  @override
  Widget body() {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Container(
        width: double.infinity,
        // height: 500,
        child: getBody(),
      ),
    );
  }

  Widget getInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.grey[700],
            ),
          ),
          Text(
            "$value",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  getBody() {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      children: _cardsList.map((item) => getCard(item)).toList(),
    );
  }

  Widget getCard(item) {
    String label = TextCapitalization(item);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              "assets/images/$item.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            // child: Image.network(
            //     "https://live.staticflickr.com/7591/16787988882_6092718e52_3k.jpg"),
          ),
          Text(
            item,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  getCompanyCard() {
    // child: Card(
    //   elevation: 5,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: Column(
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(15),
    //           topRight: Radius.circular(15),
    //         ),
    //         child: Image.network(
    //             "https://live.staticflickr.com/7591/16787988882_6092718e52_3k.jpg"),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             getInfoRow("CEO", _company.ceo.toString()),
    //             getInfoRow("Founded", _company.founded.toString()),
    //             getInfoRow("Employees", _company.employees.toString()),
    //             getInfoRow("Headquarters",
    //                 "${_company.headquarters.address}, ${_company.headquarters.state} "),
    //             // getInfoRow("About", _company.summary.toString()),
    //             getInfoRow(
    //                 "Value",
    //                 NumberFormat.compactCurrency(
    //                   locale: "en_US",
    //                   name: "\$",
    //                 ).format(_company.valuation)),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ),
  }
}
