import 'package:flutter/material.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});
  @override
  State<StatefulWidget> createState() => _stateManagerPage();
}

class _stateManagerPage extends State<ManagerPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            width: width,
            height: 80,
            color: Color(0xFFE62520),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Vé máy bay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                showListOrder(context, width),
              ],
            ),
          )
        ],
      ),
    );
  }

  showListOrder(BuildContext context, double width) {
    return Container(
      width: width - 30,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // Màu bóng với độ mờ
            offset: Offset(0, 0), // Vị trí bóng: (x, y)
            blurRadius: 10, // Độ mờ của bóng
            spreadRadius: 1, // Phạm vi lan tỏa của bóng
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mã đặt chỗ",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      "VNBKA9823498729834",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    )
                  ],
                ),
                Text(
                  "7.000.000 VND",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            width: width,
            color: Colors.red[100],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.airplane_ticket_sharp,
                    color: Colors.red,
                  ),
                  Container(
                    width: 10,
                  ),
                  Text("Đà Nẵng"),
                  Container(
                    width: 10,
                  ),
                  Icon(Icons.arrow_forward),
                  Container(
                    width: 10,
                  ),
                  Text("Singapore")
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                  child: Text(
                    "Đã hết hạn",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                Text(
                  "21:47:54, 08/12/2004",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
