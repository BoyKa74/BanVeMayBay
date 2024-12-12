import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addStartPoint extends StatefulWidget {
  const addStartPoint({super.key});

  @override
  State<StatefulWidget> createState() => _stateAddStratPoint();
}

class _stateAddStratPoint extends State<addStartPoint> {
  bool checkSearch = false;
  Map<String, List<String>> search = {};
  // Map ban đầu
  Map<String, List<String>> listLocation = {};
  // Map<String, List<String>> listLocation = {
  //   "SGN": ["Hồ Chí Minh", "Sân bay quốc tế Tân Sơn Nhất"],
  //   "HAN": ["Hà Nội", "Sân bay quốc tế Nội bài"]
  // };

  Future<QuerySnapshot> fetchLocations() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('locations').get();

    return snapshot;
  }

  @override
  void initState() {
    super.initState();
    fetchLocations().then((snapshot) {
      setState(() {
        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          final String code = data['code'] ?? '';
          final String city = data['city'] ?? '';
          final String airport = data['name'] ?? '';
          listLocation[code] = [city, airport];
        }
      });
    }).catchError((error) {
      print("Error fetching locations: $error");
    });
  }

  TextEditingController _location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: 150,
              color: Color(0xFFE62520),
            ),
            Positioned(
              top: 30,
              left: 0,
              child: Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chọn điểm khởi hành",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            Positioned(
              top: 60,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                    width: width - 30,
                    color: Colors.white,
                    child: TextField(
                      controller: _location,
                      onChanged: (data) {
                        var searchLocation = Map.fromEntries(listLocation
                            .entries
                            .where((entry) =>
                                entry.value[0] == data ||
                                entry.value[1] == data) //
                            .map((entry) => MapEntry(entry.key, entry.value)));
                        if (searchLocation.isNotEmpty) {
                          setState(() {
                            search = searchLocation;
                            checkSearch = true;
                          });
                        } else {
                          setState(() {
                            search = {};
                            checkSearch = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: "Tìm thành phố hoặc sân bay",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        filled: true,
                        fillColor: Colors.white, // Màu nền
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Đường viền bo tròn
                          borderSide: BorderSide.none, // Loại bỏ viền
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
        Expanded(
            child: (listLocation.isNotEmpty)
                ? ListView.builder(
                    itemCount:
                        checkSearch ? search.length : listLocation.length,
                    itemBuilder: (context, index) {
                      String code = checkSearch
                          ? search.keys.elementAt(index)
                          : listLocation.keys.elementAt(index);
                      List<String> detail =
                          checkSearch ? search[code]! : listLocation[code]!;
                      return GestureDetector(
                          onTap: () {
                            Navigator.pop(context, detail[0]);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    code,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      detail[0],
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      detail[1],
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                  )
                : Container(
                    child: Text("not found airport!"),
                  ))
      ],
    ));
  }
}
