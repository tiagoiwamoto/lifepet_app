import 'dart:math';

import 'package:lifepet_app/models/pet_anotacao.dart';
import 'package:lifepet_app/services/pet_service.dart';

class PetAnotacaoService{
  final List<PetAnotacao> _anotacoes = [];
  final PetService petService = PetService();

  static final PetAnotacaoService _singleton = PetAnotacaoService._internal();

  factory PetAnotacaoService(){
    return _singleton;
  }

  PetAnotacaoService._internal(){
    _anotacoes.add(PetAnotacao(
      id: "1001",
      anotacao: "Desde 2021",
      tags: "carinho,saúde,fome,sede",
      pet: petService.getPet("1")
    ));
  }

  List<PetAnotacao> getAnotacoesPet(String petId){
    return _anotacoes.where((element) => element.pet.id == petId).toList();
  }

  void saveAnotacao(PetAnotacao anotacao){
    anotacao.id = Random().nextInt(1000).toString();
    _anotacoes.add(anotacao);
  }
}