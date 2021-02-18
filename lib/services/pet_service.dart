import 'dart:math';

import 'package:lifepet_app/models/pet_model.dart';

class PetService {
  final List<Pet> _petList = [];

  static final PetService _singleton = PetService._internal();

  factory PetService(){
    return _singleton;
  }

  PetService._internal(){
    _petList.add(Pet(
        nome: "Toichi",
        imageUrl: "assets/images/toichi.jpg",
        descricao: "Cachorro york",
        idade: 8,
        sexo: "Macho",
        cor: "Branco",
        bio: "Cachorra muito ciumento",
        id: "1"));
    _petList.add(Pet(
        nome: "Mika",
        imageUrl: "assets/images/mika.jpg",
        descricao: "Cachorro york",
        idade: 3,
        sexo: "Femea",
        cor: "Branco",
        bio: "Cachorro muito levada",
        id: "2"));
    _petList.add(Pet(
        nome: "Thor Tornado",
        imageUrl: "assets/images/thor.jpg",
        descricao: "Cachorro da laiz e luis",
        idade: 1,
        sexo: "Macho",
        cor: "Cinza",
        bio: "Cachorro muito brabo",
        id: "3"));
    _petList.add(Pet(
        nome: "Melissa Manuela",
        imageUrl: "assets/images/melissa.jpg",
        descricao: "Cachorra da Rose",
        idade: 5,
        sexo: "Femea",
        cor: "Branco",
        bio: "Cachorra muito mimada",
        id: "4"));
  }

  List getAllPets(){
    return _petList;
  }

  void addPet(Pet pet){
    _petList.add(Pet(
      nome: pet.nome,
      bio: pet.bio,
      idade: pet.idade,
      sexo: pet.sexo,
      descricao: pet.descricao,
      cor: pet.cor,
      imageUrl: 'assets/images/no-image.png',
      id: Random().nextInt(100).toString()
    ));
  }

  Pet getPet(String id){
    return _petList.singleWhere((pet) {return pet.id == id;});
  }
}