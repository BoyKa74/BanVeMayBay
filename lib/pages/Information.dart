import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/PaymentScreen.dart';
import 'package:flutter_application_1/pages/Write.dart';

void main() {
  runApp(MaterialApp(home: informationScreen()));
}

class informationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Điền thông tin',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz), // 3 chấm ngang
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thẻ màu đỏ chứa "Chạm để xem thông tin vé đã chọn" và "Chuyến đi"
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chạm để xem thông tin vé đã chọn',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                'Chuyến đi',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Spacer(),
                            Text('Thứ 5, 12 tháng 12 năm 2024'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('SGN'),
                            Icon(Icons.arrow_forward),
                            Text('N/A'),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('06:00 - 07:20'),
                                SizedBox(height: 5),
                                Text('01h 20m'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('Vietravel Airlines',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Thông tin liên hệ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông tin liên hệ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => writeScreen(),
                      ),
                    );
                    print('Chỉnh sửa thông tin liên hệ');
                  },
                  child: Text(
                    'Chỉnh sửa',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Điền thông tin cá nhân'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Điền thông tin email'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Điền thông tin điện thoại'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Điền thông tin tin nhắn'),
              onTap: () {},
            ),
            SizedBox(height: 20),

            // Thông tin hành khách
            Text('Thông tin hành khách',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Thêm hành khách'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            SizedBox(height: 20),

            // Nút "TIẾP TỤC"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ),
                  );
                },
                child: Text('TIẾP TỤC'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
