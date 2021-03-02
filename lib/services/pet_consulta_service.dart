import 'dart:math';

import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/services/pet_service.dart';

class PetConsultaService{
  final List<PetConsulta> _consultas = [];
  final PetService petService = PetService();

  static final PetConsultaService _singleton = PetConsultaService._internal();

  factory PetConsultaService(){
    return _singleton;
  }

  PetConsultaService._internal(){
    _consultas.add(PetConsulta(
      id: "1001",
      nome: "Consulta A",
      descricao: "Teste",
      pet: petService.getPet("1")
    ));
  }

  List<PetConsulta> getConsultasPet(String id){
    return _consultas.where((element) => element.pet.id == id).toList();
  }

  void saveConsulta(PetConsulta consulta){
    consulta.id = Random().nextInt(100).toString();
    _consultas.add(consulta);
  }
}