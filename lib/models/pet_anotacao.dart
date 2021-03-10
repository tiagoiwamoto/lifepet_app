import 'package:lifepet_app/models/pet_model.dart';

class PetAnotacao{
  int id;
  String anotacao;
  String tags;
  int pet;

  PetAnotacao({this.id, this.anotacao, this.tags, this.pet});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'anotacao': anotacao,
      'tags': tags,
      'pet': pet,
    };
  }

  PetAnotacao.fromMap(Map map){
    id = map['id'];
    anotacao = map['anotacao'];
    tags = map['tags'];
    pet = map['pet'];
  }

  @override
  String toString() {
    return 'PetAnotacao{id: $id, anotacao: $anotacao, tags: $tags, pet: $pet}';
  }

}