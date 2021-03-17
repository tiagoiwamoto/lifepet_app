
import 'dart:convert';

import 'package:lifepet_app/models/pet_anotacao.dart';
import 'package:lifepet_app/models/pet_anotacao_file_model.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/utils/db_util.dart';
import 'package:lifepet_app/utils/file_util.dart';

class PetAnotacaoService{
  final PetService petService = PetService();
  int indexRemover;

  Future<List<PetAnotacao>> getAnotacoesPet(int id) async {
    String whereString = "pet = ?";
    List<dynamic> whereArgumento = [id];
    List<String> colunas = ["id", "anotacao", "tags", "pet"];
    final dataList = await DbUtil.getDataById('anotacoes', colunas, whereString, whereArgumento);
    return dataList.map((anotacao) => PetAnotacao.fromMap(anotacao)).toList();
  }

  void saveAnotacao(PetAnotacao anotacao) async {
    DbUtil.insertData('anotacoes', anotacao.toMap());
  }

  void deleteAnotacaoPet(int id) async {
    String whereString = "id = ?";
    List<dynamic> whereArgumento = [id];
    await DbUtil.removeData('anotacoes', whereString, whereArgumento);
  }

  void saveAnotacaoOnFile(PetAnotacao anotacao) async {
    PetAnotacaoFileModel anotacaoFileModel = PetAnotacaoFileModel(
        anotacao: anotacao.anotacao, tags: anotacao.tags, pet: anotacao.pet.toString());
    FileUtil.insertData('anotacao', anotacaoFileModel.toJson());
  }

  Future<List<PetAnotacao>> getAnotacoesPetFromFile(int id) async {
    String idString = id.toString();
    final dataList = await FileUtil.getDataFromFile('anotacao');
    List<PetAnotacaoFileModel> anotacaoList =
    dataList.map((anotacoes) => PetAnotacaoFileModel.fromJson(jsonDecode(anotacoes))).toList();
    List<PetAnotacao> petConsultas = List();
    anotacaoList.where((consulta) => consulta.pet == idString).forEach((fileAnotacao) {
      petConsultas.add(PetAnotacao(
          id: int.parse(fileAnotacao.id),
          anotacao: fileAnotacao.anotacao,
          tags: fileAnotacao.tags,
          pet: int.parse(fileAnotacao.pet)));
    });
    anotacaoList = List();
    return petConsultas;
  }

  Future<void> removeAnotacaoPetFromFile(int id) async {
    String idString = id.toString();
    final dataList = await FileUtil.getDataFromFile('anotacao');
    List<PetAnotacaoFileModel> anotacaoList =
    dataList.map((anotacoes) => PetAnotacaoFileModel.fromJson(jsonDecode(anotacoes))).toList();
    indexRemover = anotacaoList.indexWhere((anotacao) => anotacao.id == idString);
    FileUtil.removeData('anotacao', indexRemover);
  }
}