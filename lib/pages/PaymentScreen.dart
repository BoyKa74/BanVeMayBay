import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PaymentScreen()));
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedPaymentMethod;
  int remainingTime = 240; // 4 phút = 240 giây
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Khởi tạo Timer để đếm ngược
    _startTimer();
  }

  // Hàm đếm ngược
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        _timer.cancel(); // Dừng Timer khi hết thời gian
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Dừng Timer khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Hình thức thanh toán',
          style: TextStyle(color: Colors.white),
        ),
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
            // Số tiền cần thanh toán
            Text(
              'Số tiền bạn sẽ thanh toán',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '2,953,000 VND',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),

            // Thời gian đếm ngược
            Text(
              'Thời gian còn lại: ${remainingTime ~/ 60}:${remainingTime % 60 < 10 ? '0${remainingTime % 60}' : remainingTime % 60}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Lựa chọn hình thức thanh toán
            Text(
              'Lựa chọn hình thức thanh toán',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  PaymentOption(
                    value: 'Thẻ ATM nội địa',
                    icon: Icons.credit_card,
                    selectedValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  PaymentOption(
                    value: 'Ví Momo',
                    icon: Icons.account_balance_wallet,
                    selectedValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  PaymentOption(
                    value: 'Ví Zalopay',
                    icon: Icons.account_balance_wallet,
                    selectedValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  PaymentOption(
                    value: 'Thẻ tín dụng quốc tế',
                    icon: Icons.credit_card,
                    selectedValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  PaymentOption(
                    value: 'Chuyển khoản',
                    icon: Icons.money,
                    selectedValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Nút tiếp tục
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedPaymentMethod != null) {
                    // Tiến hành thanh toán
                  }
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

class PaymentOption extends StatelessWidget {
  final String value;
  final IconData icon;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  PaymentOption({
    required this.value,
    required this.icon,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Text(value),
        ],
      ),
      value: value,
      groupValue: selectedValue,
      onChanged: onChanged,
      activeColor: Colors.red,
    );
  }
}
