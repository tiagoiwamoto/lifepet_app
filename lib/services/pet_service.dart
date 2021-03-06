import 'dart:math';

import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/utils/db_util.dart';

class PetService {
  List<Pet> _petList = [];

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
        id: 1));
  }

  Future<List> getAllPets() async{
    final dataList = await DbUtil.getData('pets');
    _petList = dataList.map((pet) => Pet(
      id: pet['id'],
      nome: pet['nome'],
      imageUrl: pet['imageUrl'],
      descricao: pet['descricao'],
      idade: pet['idade'],
      cor: pet['cor'],
      sexo: pet['sexo'],
      bio: pet['bio'],
    )).toList();
    return _petList;
  }

  void addPet(Pet pet){
    final newPet = Pet(
      nome: pet.nome,
      bio: pet.bio,
      idade: pet.idade,
      sexo: pet.sexo,
      descricao: pet.descricao,
      cor: pet.cor,
      imageUrl: 'assets/images/no-image.png',
    );
    print(newPet.toMap());
    DbUtil.insertDate('pets', newPet.toMap());
  }

  Pet getPet(String id){
    return _petList.singleWhere((pet) {return pet.id == id;});
  }

  void editPet(String id, Pet newPet){
    Pet petEditar = getPet(id);
    petEditar.nome = newPet.nome;
    petEditar.descricao = newPet.descricao;
    petEditar.idade = newPet.idade;
    petEditar.sexo = newPet.sexo;
    petEditar.cor = newPet.cor;
    petEditar.bio = newPet.bio;
  }
}