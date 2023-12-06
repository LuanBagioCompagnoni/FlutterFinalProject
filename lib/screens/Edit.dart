import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../components/Header.dart';
import '../components/Menu.dart';
import '../controllers/ParkingSpot.dart';
import '../models/ParkingSpot.dart';

class Edit extends StatefulWidget {
  Edit({Key? key, required this.objeto}) : super(key: key);

  final ParkingSpotModel objeto;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _parkingSpotNumberController = TextEditingController();
  final _licensePlateCarController = TextEditingController();
  final _brandCarController = TextEditingController();
  final _modelCarController = TextEditingController();
  final _colorCarController = TextEditingController();
  final _responsibleNameController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _blockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _parkingSpotNumberController.text = widget.objeto.parkingSpotNumber;
    _licensePlateCarController.text = widget.objeto.licensePlateCar;
    _brandCarController.text = widget.objeto.brandCar;
    _modelCarController.text = widget.objeto.modelCar;
    _colorCarController.text = widget.objeto.colorCar;
    _responsibleNameController.text = widget.objeto.responsibleName;
    _apartmentController.text = widget.objeto.apartment;
    _blockController.text = widget.objeto.block;
  }

  // Create TextFormField validators
  String? validateFormField(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  // Create a handle to submit the form
  void handleSubmit() async {
    ParkingSpotModel parkingSpot = ParkingSpotModel(
      widget.objeto.id,
      _parkingSpotNumberController.text,
      _licensePlateCarController.text,
      _brandCarController.text,
      _modelCarController.text,
      _colorCarController.text,
      "",
      _responsibleNameController.text,
      _apartmentController.text,
      _blockController.text,
    );

    var controller = ParkingSpotController.parkingSpotController;
    var response = await controller.editParkingSpot(parkingSpot);

    if (response != false) {
      Get.snackbar(
        "Success",
        "Saved Successfully",
        icon: Icon(Icons.check, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Error",
        response,
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: Menu(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Número da vaga',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _parkingSpotNumberController,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Placa do carro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _licensePlateCarController,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Marca do carro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _brandCarController,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Modelo do carro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _modelCarController,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Cor do carro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _colorCarController,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome do proprietário',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _responsibleNameController,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Apartamento',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _apartmentController,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Bloco',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) => validateFormField(value!),
                        controller: _blockController,
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        onPressed: handleSubmit,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
