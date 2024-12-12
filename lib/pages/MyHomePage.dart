import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/addStartPoint.dart';
import 'package:flutter_application_1/pages/searchPlane.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _stateMyHomePage();
}

class _stateMyHomePage extends State<MyHomePage> {
  bool selectPacket = false;
  bool checkSwit = false;

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDatetwo = DateTime.now();
  DateTime selectedDate = DateTime.now();

  Map<String, int> Customer = {'NL': 1, 'TrE': 0, 'EmB': 0};

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.grey[200],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width,
              height: height * 0.22,
              color: Color(0xFFE62520),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.35,
                ),
                Image.asset(
                  'assets/logo.jpg',
                  width: 160,
                  height: 40,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: width * 0.23,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            child: Container(
              width: width,
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPacket = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: selectPacket
                                  ? Colors.white
                                  : Color(0xFFE62520),
                              width: 1),
                          borderRadius: BorderRadius.circular(5),
                          color:
                              selectPacket ? Color(0xFFE62520) : Colors.white),
                      child: Text(
                        "Tìm vé theo ngày",
                        style: TextStyle(
                            color: selectPacket
                                ? Colors.white
                                : Color(0xFFE62520)),
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPacket = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: selectPacket
                                  ? Color(0xFFE62520)
                                  : Colors.white,
                              width: 1),
                          borderRadius: BorderRadius.circular(5),
                          color:
                              selectPacket ? Colors.white : Color(0xFFE62520)),
                      child: Text(
                        "Tìm vé theo tháng",
                        style: TextStyle(
                            color: selectPacket
                                ? Color(0xFFE62520)
                                : Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 150,
              left: 0,
              child: selectPacket
                  ? monthSearch(context, width)
                  : daySearch(context, width, _selectedDate, height)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.headset_mic_rounded),
      ),
    );
  }

  monthSearch(BuildContext context, double width) {
    bool checkSwapp = false;
    String startpoint = "Ho Chi Minh";
    String destination = "Đa Nang";
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Stack(children: [
                  Container(
                    width: width,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.15), // Màu bóng với độ mờ
                          offset: Offset(0, 0), // Vị trí bóng: (x, y)
                          blurRadius: 10, // Độ mờ của bóng
                          spreadRadius: 1, // Phạm vi lan tỏa của bóng
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Điểm khởi hành",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.airplane_ticket_outlined,
                                                size: 30,
                                              ),
                                              Container(
                                                width: 10,
                                              ),
                                              Text(
                                                  checkSwapp
                                                      ? destination
                                                      : startpoint,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                        GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Điểm Đến",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.airplane_ticket_outlined,
                                                size: 30,
                                              ),
                                              Container(
                                                width: 10,
                                              ),
                                              Text(
                                                  checkSwapp
                                                      ? startpoint
                                                      : destination,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 5,
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: width - 90,
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                checkSwapp = !checkSwapp;
                              });
                            },
                            child: Icon(
                              Icons.swap_vertical_circle_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Container(
                        width: width,
                        height: checkSwit ? 180 : 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.15), // Màu bóng với độ mờ
                              offset: Offset(0, 0), // Vị trí bóng: (x, y)
                              blurRadius: 10, // Độ mờ của bóng
                              spreadRadius: 1, // Phạm vi lan tỏa của bóng
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tìm vé theo tháng",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _showDatePicker();
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                color: Colors.red,
                                              ),
                                              Text(" Chọn tháng")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ))),
                    Positioned(
                      top: 90,
                      left: 10,
                      child: Container(
                        width: width * 0.8,
                        height: 1,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.yellow, Colors.orange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30), // Bo góc hình tròn
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // Màu bóng
                        offset: Offset(0, 2), // Độ lệch bóng
                        blurRadius: 5, // Độ mờ bóng
                      ),
                    ],
                  ),
                  child: const Text(
                    'TÌM KIẾM CHUYẾN BAY',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  daySearch(BuildContext context, double width, DateTime selectedDate,
      double height) {
    Future<void> _pickDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), // Ngày mặc định
        firstDate: DateTime.now(), // Ngày bắt đầu
        lastDate: DateTime(2100), // Ngày kết thúc
      );

      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate; // Lưu ngày được chọn
        });
      }
    }

    Future<void> _pickDatetwo(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), // Ngày mặc định
        firstDate: DateTime.now(), // Ngày bắt đầu
        lastDate: DateTime(2100), // Ngày kết thúc
      );

      if (pickedDate != null && pickedDate != _selectedDatetwo) {
        setState(() {
          _selectedDatetwo = pickedDate; // Lưu ngày được chọn
        });
      }
    }

    bool checkSwapp = false;
    String startpoint = "Ho Chi Minh";
    String destination = "Đa Nang";
    List<int?> CustomerDetail = [
      Customer['NL'],
      Customer['TrE'],
      Customer['EmB']
    ];

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.all(0),
          child: Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Stack(children: [
                      Container(
                        width: width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.15), // Màu bóng với độ mờ
                              offset: Offset(0, 0), // Vị trí bóng: (x, y)
                              blurRadius: 10, // Độ mờ của bóng
                              spreadRadius: 1, // Phạm vi lan tỏa của bóng
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          addStartPoint(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(
                                            0.0, 1.0); // Từ dưới cùng màn hình
                                        const end = Offset
                                            .zero; // Kết thúc ở vị trí hiện tại
                                        const curve = Curves.easeInOut;

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        var offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );

                                  if (result != null) {
                                    setState(() {
                                      checkSwapp
                                          ? destination = result
                                          : startpoint = result;
                                    });
                                  }
                                  print(startpoint);
                                },
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Điểm khởi hành",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .airplane_ticket_outlined,
                                                    size: 30,
                                                    color: Colors.red,
                                                  ),
                                                  Container(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      checkSwapp
                                                          ? destination
                                                          : startpoint,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                            GestureDetector(
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          addStartPoint(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(
                                            0.0, 1.0); // Từ dưới cùng màn hình
                                        const end = Offset
                                            .zero; // Kết thúc ở vị trí hiện tại
                                        const curve = Curves.easeInOut;

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        var offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );

                                  if (result != null) {
                                    setState(() {
                                      checkSwapp
                                          ? startpoint = result
                                          : destination = result;
                                    });
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Điểm Đến",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .airplane_ticket_outlined,
                                                      size: 30,
                                                      color: Colors.red),
                                                  Container(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      checkSwapp
                                                          ? startpoint
                                                          : destination,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 5,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                width: width - 90,
                                height: 1,
                                color: Colors.grey,
                              ),
                              Container(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    checkSwapp = !checkSwapp;
                                  });
                                },
                                child: Icon(
                                  Icons.swap_vertical_circle_outlined,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Stack(
                      children: [
                        Container(
                            width: width,
                            height: checkSwit ? 180 : 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.15), // Màu bóng với độ mờ
                                  offset: Offset(0, 0), // Vị trí bóng: (x, y)
                                  blurRadius: 10, // Độ mờ của bóng
                                  spreadRadius: 1, // Phạm vi lan tỏa của bóng
                                ),
                              ],
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ngày khởi hành",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _pickDate(context);
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.airplane_ticket_sharp,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("Khứ hồi"),
                                            Switch(
                                              value: checkSwit,
                                              onChanged: (bool value) {
                                                if (value) {
                                                  _pickDatetwo(context);
                                                }
                                                setState(() {
                                                  checkSwit = value;
                                                });
                                              },
                                              activeColor: Colors.red,
                                              inactiveThumbColor: Colors.grey,
                                              inactiveTrackColor:
                                                  Colors.transparent,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    checkSwit
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Ngày về",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _pickDatetwo(context);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .airplane_ticket_sharp,
                                                          color: Colors.red,
                                                        ),
                                                        Text(
                                                            "${_selectedDatetwo.day}/${_selectedDatetwo.month}/${_selectedDatetwo.year}")
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container()
                                  ],
                                ))),
                        Positioned(
                          top: 90,
                          left: 10,
                          child: Container(
                            width: width * 0.8,
                            height: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                        width: width,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.15), // Màu bóng với độ mờ
                              offset: Offset(0, 0), // Vị trí bóng: (x, y)
                              blurRadius: 10, // Độ mờ của bóng
                              spreadRadius: 1, // Phạm vi lan tỏa của bóng
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: GestureDetector(
                              onTap: () {
                                addCustomer(context, width);
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hành khách",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.supervisor_account,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        "${Customer['NL']} người lớn, ${Customer['TrE']} trẻ em, ${Customer['EmB']} em bé",
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))),
                  ),
                  Container(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  searchPlane(
                                      startpoint: startpoint,
                                      endpoint: destination,
                                      customer: CustomerDetail,
                                      startday: _selectedDate),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin =
                                Offset(0.0, 1.0); // Từ dưới cùng màn hình
                            const end =
                                Offset.zero; // Kết thúc ở vị trí hiện tại
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.yellow, Colors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius:
                            BorderRadius.circular(30), // Bo góc hình tròn
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26, // Màu bóng
                            offset: Offset(0, 2), // Độ lệch bóng
                            blurRadius: 5, // Độ mờ bóng
                          ),
                        ],
                      ),
                      child: const Text(
                        'TÌM KIẾM CHUYẾN BAY',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }

  addCustomer(BuildContext context, double width) async {
    final updateCustomer = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white, // Màu nền
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Bo góc phía trên
        ),
      ),
      builder: (BuildContext context) {
        Map<String, int> localCustomer = Customer;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 400,
              width: width, // Chiều cao của hộp
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "Hành khách",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: width,
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Người lớn",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Từ 12 tuổi trở lên",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              Container(
                                width: 190,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (localCustomer['NL']! < 2)
                                            ? localCustomer['NL'] = 1
                                            : localCustomer['NL'] =
                                                (localCustomer['NL']! - 1);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: (localCustomer['NL']! < 2)
                                          ? Colors.grey[200]
                                          : Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                  Text(
                                    "${localCustomer['NL']}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (localCustomer['NL']! < 9)
                                            ? localCustomer['NL'] =
                                                (localCustomer['NL']! + 1)
                                            : localCustomer['NL'];
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Trẻ em",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Từ 2 đến 11 tuổi",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              Container(
                                width: 192,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (localCustomer['TrE']! <= 0)
                                            ? localCustomer['TrE'] = 0
                                            : localCustomer['TrE'] =
                                                (localCustomer['TrE']! - 1);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: (localCustomer['TrE']! == 0)
                                          ? Colors.grey[200]
                                          : Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                  Text(
                                    "${localCustomer['TrE']}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (localCustomer['TrE']! < 9)
                                            ? localCustomer['TrE'] =
                                                (localCustomer['TrE']! + 1)
                                            : localCustomer['TrE'];
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Em bé",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Dưới 2 tuổi",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              Container(
                                width: 228,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (localCustomer['EmB']! <= 0)
                                            ? localCustomer['EmB'] = 0
                                            : localCustomer['EmB'] =
                                                (localCustomer['EmB']! - 1);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: (localCustomer['EmB']! <= 0)
                                          ? Colors.grey[200]
                                          : Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                  Text(
                                    "${localCustomer['EmB']}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (localCustomer['EmB']! < 9)
                                            ? localCustomer['EmB'] =
                                                (localCustomer['EmB']! + 1)
                                            : localCustomer['EmB'];
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context, localCustomer);
                              // Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 180),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.yellow, Colors.orange],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(
                                    30), // Bo góc hình tròn
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26, // Màu bóng
                                    offset: Offset(0, 2), // Độ lệch bóng
                                    blurRadius: 5, // Độ mờ bóng
                                  ),
                                ],
                              ),
                              child: const Text(
                                'XÁC NHẬN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );

    if (updateCustomer != null) {
      setState(() {
        Customer = updateCustomer;
      });
    }
  }

  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Chọn Tháng và Năm",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      scrollController: FixedExtentScrollController(
                        initialItem: selectedDate.month - 1,
                      ),
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedDate = DateTime(
                              selectedDate.year, index + 1, selectedDate.day);
                        });
                      },
                      children: List.generate(12, (index) {
                        return Center(
                          child: Text(
                            'Tháng ${index + 1}',
                            style: TextStyle(fontSize: 24),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      scrollController: FixedExtentScrollController(
                        initialItem: selectedDate.year - 2024,
                      ),
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedDate = DateTime(2024 + index,
                              selectedDate.month, selectedDate.day);
                        });
                      },
                      children: List.generate(20, (index) {
                        return Center(
                          child: Text(
                            '${2024 + index}',
                            style: TextStyle(fontSize: 24),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // In ra kết quả chọn tháng và năm
                  print(
                      "Tháng: ${selectedDate.month}, Năm: ${selectedDate.year}");
                },
                child: Text('Xác Nhận'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
        );
      },
    );
  }
}
