import 'dart:convert';

import 'package:lifepet_app/models/pet_consulta_file_model.dart';
import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/utils/db_util.dart';
import 'package:lifepet_app/utils/file_util.dart';

class PetConsultaService {
  final PetService petService = PetService();

  Future<List<PetConsulta>> getConsultasPet(int id) async {
    String whereString = "pet = ?";
    List<dynamic> whereArgumento = [id];
    List<String> colunas = ["id", "nome", "data", "descricao", "pet"];
    final dataList = await DbUtil.getDataById('consultas', colunas, whereString, whereArgumento);
    return dataList.map((consulta) => PetConsulta.fromMap(consulta)).toList();
  }

  void saveConsulta(PetConsulta consulta) async {
    DbUtil.insertData('consultas', consulta.toMap());
  }

  void saveConsultaOnFile(PetConsulta consulta) async {
    PetConsultaFileModel fileConsulta = PetConsultaFileModel(
        titulo: consulta.nome, data: consulta.data, pet: consulta.pet.toString(), descricao: consulta.descricao);
    FileUtil.insertData('consulta', fileConsulta.toJson());
  }

  Future<List<PetConsulta>> getConsultasPetFromFile(int id) async {
    String idString = id.toString();
    final dataList = await FileUtil.getDataFromFile('consulta');
    List<PetConsultaFileModel> consultaList =
        dataList.map((consultas) => PetConsultaFileModel.fromJson(jsonDecode(consultas))).toList();
    List<PetConsulta> petConsultas = List();
    consultaList.where((consulta) => consulta.pet == idString).forEach((fileConsulta) {
      petConsultas.add(PetConsulta(
          id: int.parse(fileConsulta.id),
          nome: fileConsulta.titulo,
          data: fileConsulta.data,
          descricao: fileConsulta.descricao,
          pet: int.parse(fileConsulta.pet)));
    });
    consultaList = List();
    return petConsultas;
  }
}
