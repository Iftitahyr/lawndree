import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Lawndre',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cucian numpuk di pojokan kamar, nyempil di kolong kasur, bawa ke Lawndré aja. Solusi tepat bagi yang tak sempat.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              'Kami menyediakan berbagai layanan:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildServiceList(),
            SizedBox(height: 20),
            Text(
              'Jangan sampe pakaian kalian terlalu lama menumpuk di dalam lemari, sedangkan setrika pun tak ada, atau bahkan tak sempat menyetrika karena terlalu sibuk. Simpan tenaga kalian, persiapkan diri untuk hari produktif esok hari. Soal nyuci, Lawndré adalah solusi.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              'Kunjungi Instagram kami untuk informasi terbaru: ${controller.instagramHandle}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Lokasi kami: ${controller.address}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceList() {
    final services = [
      'Cuci Lipat',
      'Cuci Setrika',
      'Cuci Sepatu',
      'Cuci Ransel',
      'Cuci Selimut dan Carpet',
      'Cuci Gorden',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: services.map((service) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            '${services.indexOf(service) + 1}. $service',
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}