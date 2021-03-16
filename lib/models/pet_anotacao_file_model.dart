import 'dart:math';

class PetAnotacaoFileModel {

  String id;
  String anotacao;
  String tags;
  String pet;

  PetAnotacaoFileModel({this.id, this.anotacao, this.tags, this.pet});

  Random random = new Random();

  Map<String, dynamic> toJson(){
    return {
      'id': random.nextInt(1000).toString(),
      'anotacao': anotacao,
      'tags': tags,
      'pet': pet,
    };
  }

  PetAnotacaoFileModel.fromJson(Map map){
    id = map['id'];
    anotacao = map['anotacao'];
    tags = map['tags'];
    pet = map['pet'];
  }
}