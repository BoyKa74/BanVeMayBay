import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ManagerPage.dart';
import 'package:flutter_application_1/pages/MyHomePage.dart';
import 'pages/select_flight_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Layout(),
    );
  }
}

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<StatefulWidget> createState() => _stateLayout();
}

class _stateLayout extends State<Layout> {
  int _currentIndex = 0;
  static const List<Widget> _pages = <Widget>[
    MyHomePage(),
    ManagerPage(),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: _pages[_currentIndex], // Nội dung sẽ thay đổi theo tab
        bottomNavigationBar: Stack(
          children: [
            Container(
              height: 60,
              child: BottomNavigationBar(
                currentIndex: _currentIndex, // Tab đang được chọn
                onTap: (index) {
                  setState(() {
                    _currentIndex = index; // Cập nhật chỉ số khi bấm vào tab
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.airplanemode_active_outlined),
                    label: 'Đặt vé', // Text bên dưới icon
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.speaker_notes_outlined),
                    label: 'Quản lý đặt chỗ', // Text bên dưới icon
                  ),
                ],
                selectedItemColor: Colors.red, // Màu cho tab được chọn
                unselectedItemColor: Colors.grey, // Màu cho tab không được chọn
                type:
                    BottomNavigationBarType.fixed, // Giữ vị trí các tab cố định
              ),
            ),
            Positioned(
              bottom: 10,
              left: width * 0.5,
              child: Container(
                width: 1,
                height: 50,
                color: Colors.grey[300],
              ),
            )
          ],
        ));
  }
}
