import 'dart:math';

import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/services/pet_service.dart';

class PetConsultaService{
  final List<PetConsulta> _consultas = [];
  final PetService petService = PetService();

  List<PetConsulta> getConsultasPet(String id){
    return _consultas.where((element) => element.pet.id == id).toList();
  }

  void saveConsulta(PetConsulta consulta){
    consulta.id = Random().nextInt(100).toString();
    _consultas.add(consulta);
  }
}