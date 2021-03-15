import 'dart:math';

class PetConsultaFileModel {

  String pet, id, titulo, data, descricao;

  PetConsultaFileModel({this.pet, this.id, this.titulo, this.data, this.descricao});

  Random random = new Random();

  Map<String, dynamic> toJson(){
    return {
      'id': random.nextInt(1000).toString(),
      'titulo': titulo,
      'data': data,
      'pet': pet,
      'descricao': descricao,
    };
  }

  PetConsultaFileModel.fromJson(Map map){
    id = map['id'];
    titulo = map['titulo'];
    data = map['data'];
    pet = map['pet'];
    descricao = map['descricao'];
  }

}