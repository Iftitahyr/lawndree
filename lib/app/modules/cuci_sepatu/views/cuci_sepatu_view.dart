// views/cuci_Sepatu_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/schedule_pickup/views/schedule_pickup_view.dart';
import '../controllers/cuci_sepatu_controller.dart';
import '../widgets/service_card.dart';

class CuciSepatuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CuciSepatuController controller = Get.put(CuciSepatuController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Cuci Sepatu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Layanan:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            ServiceCard(
              title: "Sepatu Putih",
              price: controller.price213,
              quantity: controller.quantity213,
              onIncrement: controller.increment213,
              onDecrement: controller.decrement213,
            ),
            ServiceCard(
              title: "Sepatu Kulit",
              price: controller.price243,
              quantity: controller.quantity243,
              onIncrement: controller.increment243,
              onDecrement: controller.decrement243,
            ),
            ServiceCard(
              title: "Sepatu Kain",
              price: controller.price274,
              quantity: controller.quantity274,
              onIncrement: controller.increment274,
              onDecrement: controller.decrement274,
            ),
            SizedBox(height: 20),
            Obx(
              () => Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 242, 241, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Grand Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Text('Rp. ${controller.grandTotal}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.to(SchedulePickupView()),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(55, 94, 97, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
