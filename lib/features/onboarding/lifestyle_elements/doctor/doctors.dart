import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/skip_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';

import 'package:http/http.dart' as http;
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/homescreens/home/ui/home_page.dart';
import 'package:well_path/helper/helpers.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

bool isLoader = false;

class _DoctorPageState extends State<DoctorPage> {
  List responses = [];
  int selectedindex = 500;
  String selectedId = "";
  GetAllDoctors() async {
    try {
      final response = await http.get(
        Uri.parse('https://server.wellpath.health/api/v1/user'),
      );

      var res_data = json.decode(response.body.toString());
      if (res_data['status']['code'] == 200) {
        responses.clear();
        setState(() {
          isLoader = true;
          responses = res_data['data']; // Add each response to the list

          print("abc${responses.length}");
        });
      } else {
        print("catch");
        // Get.snackbar('Error', res_data['message'], snackPosition: SnackPosition.TOP, colorText: Colors.white, backgroundColor: Colors.black);
      }
    } catch (e) {
      print("catch");
      // Get.back();
      // Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3), colorText: Colors.white);
    }
  }

  selectDoctor(context, data) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
            child: CircularProgressIndicator(
          color: appPrimaryColor,
        ));
      },
    );

    final uri = Uri.parse('https://server.wellpath.health/api/v1/user/select_doctor');

    print(data.toString());
    String jsonBody = json.encode(data);
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status']['code'] == 201) {
        Navigator.pop(context);
        Navigator.of(context).pushNamed(HomePage.route);
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WellPathAppBar(
          leading: AppBarBackButton(
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // actions: [
          //   SkipActionButton(onSkipPressed: () {
          //     print("Asjad");
          //     GetAllDoctors();
          //   })
          // ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Select Your Doctor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 610,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: responses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                          selectedId = responses[index]['id'].toString();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: selectedindex == index ? Colors.grey.withOpacity(0.3) : Color(0xffEEF0F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffECF2FF),
                                    border: Border.all(color: Colors.blueAccent),
                                  ),
                                  child: responses[index]['user_details']['profile_picture'] != null
                                      ? Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.blueAccent),
                                              image: DecorationImage(
                                                  image: NetworkImage(responses[index]['user_details']['profile_picture']), fit: BoxFit.fill),
                                            ),
                                          ),
                                        )
                                      : Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.blueAccent),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${responses[index]['user_details']['title'].toString()}. ${responses[index]['user_details']['full_name'].toString()}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  responses[index]['email'].toString(),
                                  style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  responses[index]['user_details']['contact_phone'].toString(),
                                  style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      responses[index]['user_details']['institute_name'].toString(),
                                      style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: WellPathButton(
                buttonText: 'Save Changes',
                onPressed: () async {
                  print(userGlobalId);
                  print(selectedId);
                  var data = {
                    "doctor_id": selectedId.toString(),
                    "user_id": userGlobalId.toString(),
                  };
                  selectDoctor(context, data);
                },
              ),
            ),
          ],
        ));
  }
}
