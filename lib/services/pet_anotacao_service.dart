
import 'package:lifepet_app/models/pet_anotacao.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/utils/db_util.dart';

class PetAnotacaoService{
  final PetService petService = PetService();

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
}