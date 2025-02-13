// cuci_lipat_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/cuci_lipat/views/cuci_lipat_view.dart';
import '../controllers/lipat_item_controller.dart';

class LipatItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LipatItemController controller = Get.put(LipatItemController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Cuci Lipat"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildItemBox("assets/images/kemeja.png", "Kemeja", "kemeja", controller),
            _buildItemBox("assets/images/kaos.png", "Kaos", "kaos", controller),
            _buildItemBox("assets/images/celana.png", "Celana", "celana", controller),
            _buildItemBox("assets/images/jaket.png", "Jaket", "jaket", controller),
            _buildItemBox(null, "Lain-nya", "lainnya", controller),  // No image for "Lain-nya"
            SizedBox(height: 20),
            _buildTotalItems(controller),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(CuciLipatView());  // Replace with the destination page you want to navigate to
              },
              child: Text(
                "Continue", 
                style: TextStyle(color: Colors.white),
                ),
              style: ElevatedButton.styleFrom(
                
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                backgroundColor: Color.fromRGBO(55, 94, 97, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Refined Item box widget with image, text, and border
  Widget _buildItemBox(String? imagePath, String label, String item, LipatItemController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300), // Border color
          borderRadius: BorderRadius.circular(16), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (imagePath != null) ...[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(imagePath, fit: BoxFit.contain), // Item image
                    ),
                  ),
                  SizedBox(width: 12),
                ],
                Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => controller.decrement(item),
                  color: Color.fromRGBO(55, 94, 97, 1),
                ),
                Obx(() {
                  // Observe the count dynamically
                  switch (item) {
                    case 'kemeja':
                      return Text("${controller.kemejaCount.value}");
                    case 'kaos':
                      return Text("${controller.kaosCount.value}");
                    case 'celana':
                      return Text("${controller.celanaCount.value}");
                    case 'jaket':
                      return Text("${controller.jaketCount.value}");
                    case 'lainnya':
                      return Text("${controller.lainnyaCount.value}");
                    default:
                      return Text("0");
                  }
                }),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => controller.increment(item),
                  color: Color.fromRGBO(55, 94, 97, 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Total items widget with styling
  Widget _buildTotalItems(LipatItemController controller) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(227, 242, 241, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total Items:", style: TextStyle(fontSize: 16)),
          Obx(() => Text("${controller.totalItems}", style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
