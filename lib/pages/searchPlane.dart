import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Information.dart';
import 'package:flutter_application_1/pages/select_flight_screen.dart';

class searchPlane extends StatefulWidget {
  const searchPlane(
      {super.key,
      required this.startpoint,
      required this.endpoint,
      required this.customer,
      required this.startday});

  final String startpoint;
  final String endpoint;
  final List<int?> customer;
  final DateTime startday;

  @override
  State<StatefulWidget> createState() => _stateSearchPlane();
}

class _stateSearchPlane extends State<searchPlane> {
  Future<QuerySnapshot> fetchLocations() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('sticker').get();
    return snapshot;
  }

  List<String> weekdays = [
    "Chủ Nhật", // index 0
    "Thứ 2", // index 1
    "Thứ 3", // index 2
    "Thứ 4", // index 3
    "Thứ 5", // index 4
    "Thứ 6", // index 5
    "Thứ 7", // index 6
  ];
  List<List> tickers = [];
  @override
  void initState() {
    super.initState();
    fetchLocations().then((snapshot) {
      setState(() {
        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          List<dynamic> ticket = [
            data['start'] ?? "N/A",
            data['end'] ?? "N/A",
            data['CodeStart'] ?? "N/A",
            "N/A",
            data['time'] ?? "N/A",
            data['Stoppoint'] ?? "N/A",
            data['status'] ?? "N/A",
            data['Company'] ?? "N/A",
            data['NL'] ?? "0",
            data['TE'] ?? "0",
            data['EB'] ?? "0",
          ];

          tickers.add(ticket);
          print(tickers);
        }
      });
    }).catchError((error) {
      print("Error fetching locations: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy thứ trong tuần
    // List<List> tickers = [
    //   [
    //     "06:05",
    //     "08:15",
    //     "SGN",
    //     "N/A",
    //     "02h 10m",
    //     "Bay thẳng",
    //     "Thương gia tiêu chuẩn",
    //     "Vietnam Airilines",
    //     "7000000",
    //     "4000000",
    //     "1000000",
    //     ""
    //   ],
    //   [
    //     "06:05",
    //     "08:15",
    //     "SGN",
    //     "N/A",
    //     "02h 10m",
    //     "Bay thẳng",
    //     "Thương gia tiêu chuẩn",
    //     "Vietnam Airilines",
    //     "7000000",
    //     "4000000",
    //     "1000000",
    //     ""
    //   ],
    //   [
    //     "06:05",
    //     "08:15",
    //     "SGN",
    //     "N/A",
    //     "02h 10m",
    //     "Bay thẳng",
    //     "Thương gia tiêu chuẩn",
    //     "Vietnam Airilines",
    //     "7000000",
    //     "4000000",
    //     "1000000",
    //     ""
    //   ],
    //   [
    //     "06:05",
    //     "08:15",
    //     "SGN",
    //     "N/A",
    //     "02h 10m",
    //     "Bay thẳng",
    //     "Thương gia tiêu chuẩn",
    //     "Vietnam Airilines",
    //     "7000000",
    //     "4000000",
    //     "1000000",
    //     ""
    //   ]
    // ];
    String dayOfWeek = weekdays[widget.startday.weekday % 7];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: 80,
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                    ),
                    Text(
                      "Chuyến đi: ${widget.startpoint} - ${widget.endpoint}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${dayOfWeek}, ${widget.startday.day} tháng ${widget.startday.month}",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                        // IconButton(
                        //   onPressed: (){},
                        //   icon: Icon(Icons.keyboard_arrow_down_outlined, size: 25, color: Colors.white,),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                width: width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.15), // Màu bóng với độ mờ
                      offset: Offset(0, 0), // Vị trí bóng: (x, y)
                      blurRadius: 10, // Độ mờ của bóng
                      spreadRadius: 1, // Phạm vi lan tỏa của bóng
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.grey,
                            width: 2,
                            style: BorderStyle.solid),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sắp xếp"),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.grey,
                            width: 2,
                            style: BorderStyle.solid),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Bộ lọc"),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.grey,
                            width: 2,
                            style: BorderStyle.solid),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Thay đổi ngày"),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: tickers.length,
            itemBuilder: (context, i) {
              List ticker = tickers[i];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => informationScreen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        width: width - 30,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.15), // Màu bóng với độ mờ
                              offset: Offset(0, 0), // Vị trí bóng: (x, y)
                              blurRadius: 1, // Độ mờ của bóng
                              spreadRadius: 1, // Phạm vi lan tỏa của bóng
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                    ),
                                    Text(
                                      ticker[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                                style: BorderStyle.solid),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          height: 2,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                                style: BorderStyle.solid),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Text(
                                      ticker[1],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      width: width - 250,
                                    ),
                                    Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.grey[200],
                                        child: GestureDetector(
                                          onTap: () {},
                                          child:
                                              Icon(Icons.keyboard_arrow_down),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 10,
                                    ),
                                    Text(ticker[2]),
                                  ],
                                ),
                                Container(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Text(
                                      "${ticker[4]}  |  ${ticker[5]}  |  ${ticker[6]}",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                      ),
                      Container(
                          width: width - 30,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.15), // Màu bóng với độ mờ
                                offset: Offset(0, 0), // Vị trí bóng: (x, y)
                                blurRadius: 1, // Độ mờ của bóng
                                spreadRadius: 1, // Phạm vi lan tỏa của bóng
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ticker[7],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "${int.parse(ticker[8]) * widget.customer[0]! + int.parse(ticker[9]) * widget.customer[1]! + int.parse(ticker[10]) * widget.customer[2]!} VND",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orangeAccent),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
