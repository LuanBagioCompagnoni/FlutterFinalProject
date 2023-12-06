import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ParkingSpot.dart';
import 'Details.dart';
import 'Edit.dart';
import '../components/Header.dart';
import '../components/Menu.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      drawer: Menu(context),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.listParkingSpotObs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Text(
                          controller.listParkingSpotObs[index].licensePlateCar,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Parking Spot: ${controller.listParkingSpotObs[index].parkingSpotNumber}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                Get.to(
                                  Details(
                                    licensePlate: controller
                                        .listParkingSpotObs[index]
                                        .licensePlateCar,
                                    parkingSpotNumber: controller
                                        .listParkingSpotObs[index]
                                        .parkingSpotNumber,
                                    brandCar: controller
                                        .listParkingSpotObs[index].brandCar,
                                    modelCar: controller
                                        .listParkingSpotObs[index].modelCar,
                                    colorCar: controller
                                        .listParkingSpotObs[index].colorCar,
                                    registrationDate: controller
                                        .listParkingSpotObs[index]
                                        .registrationDate,
                                    responsibleName: controller
                                        .listParkingSpotObs[index]
                                        .responsibleName,
                                    apartment: controller
                                        .listParkingSpotObs[index].apartment,
                                    block: controller
                                        .listParkingSpotObs[index].block,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Get.to(Edit(
                                  objeto: controller.listParkingSpotObs[index],
                                ));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                var response =
                                    await controller.deleteParkingSpot(
                                        controller.listParkingSpotObs[index]);
                                if (response != false) {
                                  Get.snackbar(
                                    "Sucesso",
                                    "Deletado com sucesso",
                                  );
                                  await controller.listParkingSpot();
                                } else {
                                  Get.snackbar("Erro", "Erro ao deletar");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
