// import 'dart:async';
// import 'dart:convert';

// import 'package:http/http.dart' show Client;
// import 'package:csv/csv.dart';
// import '../model/mask.dart';

// class MaskApiProvider {
//   static const covid19PatientsApiURL =
//       "https://stopcovid19.metro.tokyo.lg.jp/data/130001_tokyo_covid19_patients.csv";
//   Client client = Client();

//   Future<List<Mask>> fetchMask() async {
//     print("MaskApiProvider fetchMask");
//     final response = await client.get(covid19PatientsApiURL);
//     if (response.statusCode == 200) {
//       List<List<dynamic>> csvList =
//           CsvToListConverter().convert(utf8.decode(response.bodyBytes));

//       //csvの最初の行を削除
//       csvList.removeAt(0);
//       List<Mask> maskList = csvList
//           .map((c) => Mask(
//               shopId: c[0].toString(),
//               adultNum: int.parse(c[4].toString()),
//               childNum: int.parse(c[5].toString()),
//               updatedAtStr: c[6].toString())).toList();

//       return maskList;
//     } else {
//       print("status code is not 200 but ${response.statusCode}");
//       throw Exception('Failed to load beers');
//     }
//   }
// }