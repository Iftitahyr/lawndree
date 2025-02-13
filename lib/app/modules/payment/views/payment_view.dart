// payment_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/login/views/login_view.dart';
import 'package:lawndre_project/app/modules/payment/controllers/payment_controller.dart';
import 'package:lawndre_project/app/modules/pickup_order/views/pickup_order_view.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: Center( // Gunakan Center untuk menempatkan semuanya di tengah
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Menggunakan min agar hanya sesuai konten
            crossAxisAlignment: CrossAxisAlignment.center, // Posisikan elemen di tengah secara horizontal
            children: [
              Text(
                'Select your payment method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              _buildPaymentButton(
                context,
                'Cash',
                Icons.attach_money,
                Colors.green,
                () => controller.showConfirmationDialog(context, 'Cash'),
              ),
              SizedBox(height: 20),
              _buildPaymentButton(
                context,
                'E-Cash',
                Icons.account_balance_wallet,
                Colors.blue,
                () => controller.showConfirmationDialog(context, 'E-Cash'),
              ),
              SizedBox(height: 40), // Beri jarak antara tombol metode pembayaran dan tombol Confirm
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membuat tombol pembayaran
  Widget _buildPaymentButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Widget untuk tombol confirm di bagian bawah
  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () => Get.to(PickupOrderView()),
      child: Text('Confirm', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        backgroundColor: Color.fromRGBO(55, 94, 97, 1),
      ),
    );
  }
}
