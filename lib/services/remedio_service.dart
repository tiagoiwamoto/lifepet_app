import 'dart:math';

import 'package:lifepet_app/models/remedio_model.dart';
import 'package:lifepet_app/services/pet_service.dart';

class RemedioService {
  final List<Remedio> _remedioList = [];
  final PetService petService = PetService();

  static final RemedioService _singleton = RemedioService._internal();

  factory RemedioService(){
    return _singleton;
  }

  RemedioService._internal(){
    _remedioList.add(Remedio(
      nome: "Remédio X",
      data: "10/10/2020",
      id: "100",
      pet: petService.getPet("1")
    ));
    _remedioList.add(Remedio(
        nome: "Remédio A",
        data: "12/08/2020",
        id: "101",
        pet: petService.getPet("1")
    ));
  }

  List getRemediosPet(String id){
    return _remedioList.where((remedio) {
      return remedio.pet.id == id;
    }).toList();
  }

  void addRemedio(Remedio remedio){
    _remedioList.add(Remedio(
      nome: remedio.nome,
      data: remedio.data,
      id: Random().nextInt(100).toString(),
      pet: remedio.pet
    ));
  }
}