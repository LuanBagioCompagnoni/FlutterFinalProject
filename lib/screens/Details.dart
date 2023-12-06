import 'package:flutter/material.dart';

import '../components/Header.dart';
import '../components/Menu.dart';

class Details extends StatelessWidget {
  final String licensePlate;
  final String parkingSpotNumber;
  final String brandCar;
  final String modelCar;
  final String colorCar;
  final String registrationDate;
  final String responsibleName;
  final String apartment;
  final String block;

  // Constructor that receives the data as parameters
  Details({
    required this.licensePlate,
    required this.parkingSpotNumber,
    required this.brandCar,
    required this.modelCar,
    required this.colorCar,
    required this.registrationDate,
    required this.responsibleName,
    required this.apartment,
    required this.block,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Veículo'),
      ),
      drawer: Menu(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detalhes do Veículo',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Número da vaga: $parkingSpotNumber'),
                    Text('Placa: $licensePlate'),
                    Text('Marca do carro: $brandCar'),
                    Text('Modelo do carro: $modelCar'),
                    Text('Cor do carro: $colorCar'),
                    Text('Data do registro: $registrationDate'),
                    Text('Nome do proprietário: $responsibleName'),
                    Text('Apartamento: $apartment'),
                    Text('Bloco: $block'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
