import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/coupon/views/coupon_view.dart';
import 'package:lawndre_project/app/modules/cuci_gorden/views/cuci_gorden_view.dart';
import 'package:lawndre_project/app/modules/cuci_ransel/views/cuci_ransel_view.dart';
import 'package:lawndre_project/app/modules/cuci_sepatu/views/cuci_sepatu_view.dart';
import 'package:lawndre_project/app/modules/lipat_item/views/lipat_item_view.dart';
import 'package:lawndre_project/app/modules/profile/views/bottom_nav_bar_view.dart';
import 'package:lawndre_project/app/modules/setrika_item/views/setrika_item_view.dart';
import '../../selimut_carpet_item/views/selimut_carpet_item_view.dart';
import '../controllers/home_page_controller.dart';
import '../widgets/service_card.dart';

class HomePageView extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                        controller.userName.value,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Obx(() => Text(
                        controller.userPhone.value,
                        style: TextStyle(fontSize: 16),
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 242, 241, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dapatkan cuci gratis tiap",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "10x cuci",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => Get.to(CouponView()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(55, 94, 97, 1),
                      ),
                      child: Text("Disini", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Layanan :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                children: [
                  ServiceCard(
                    title: 'Cuci Lipat',
                    icon: 'cuci_lipat.png',
                    onTap: () => Get.to(LipatItemView()), // Navigate to Cuci Lipat page
                  ),
                  ServiceCard(
                    title: 'Cuci Setrika',
                    icon: 'cuci_setrika.png',
                    onTap: () => Get.to(SetrikaItemView()), // Navigate to Cuci Setrika page
                  ),
                  ServiceCard(
                    title: 'Cuci Sepatu',
                    icon: 'cuci_sepatu.png',
                    onTap: () => Get.to(CuciSepatuView()), // Navigate to Cuci Sepatu page
                  ),
                  ServiceCard(
                    title: 'Cuci Ransel',
                    icon: 'cuci_ransel.png',
                    onTap: () => Get.to(CuciRanselView()), // Navigate to Cuci Ransel page
                  ),
                  ServiceCard(
                    title: 'Selimut dan Carpet',
                    icon: 'selimut_carpet.png',
                    onTap: () => Get.to(SelimutCarpetItemView()), // Navigate to Selimut Carpet page
                  ),
                  ServiceCard(
                    title: 'Cuci Gorden',
                    icon: 'cuci_gorden.png',
                    onTap: () => Get.to(CuciGordenView()), // Navigate to Cuci Gorden page
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
