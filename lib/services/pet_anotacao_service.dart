import 'dart:math';

import 'package:lifepet_app/models/pet_anotacao.dart';
import 'package:lifepet_app/services/pet_service.dart';

class PetAnotacaoService{
  final List<PetAnotacao> _anotacoes = [];
  final PetService petService = PetService();

  List<PetAnotacao> getAnotacoesPet(String petId){
    return _anotacoes.where((element) => element.pet.id == petId).toList();
  }

  void saveAnotacao(PetAnotacao anotacao){
    anotacao.id = Random().nextInt(1000).toString();
    _anotacoes.add(anotacao);
  }
}