import 'package:lifepet_app/models/pet_model.dart';

class PetConsulta{
  int id;
  String nome;
  String data;
  String descricao;
  int pet;

  PetConsulta({this.id, this.nome, this.data, this.descricao, this.pet});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'nome': nome,
      'data': data,
      'descricao': descricao,
      'pet': pet,
    };
  }

  PetConsulta.fromMap(Map map){
    id = map['id'];
    nome = map['nome'];
    data = map['data'];
    descricao = map['descricao'];
    pet = map['pet'];
  }

  @override
  String toString() {
    return 'PetConsulta{id: $id, nome: $nome, data: $data, descricao: $descricao, pet: $pet}';
  }
}