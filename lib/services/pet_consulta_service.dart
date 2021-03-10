
import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/utils/db_util.dart';

class PetConsultaService{

  final PetService petService = PetService();

  Future<List<PetConsulta>> getConsultasPet(int id) async {
    String whereString = "pet = ?";
    List<dynamic> whereArgumento = [id];
    List<String> colunas = ["id", "nome", "data", "descricao", "pet"];
    final dataList = await DbUtil.getDataById('consultas', colunas, whereString, whereArgumento);
    return dataList.map((consulta) => PetConsulta.fromMap(consulta)).toList();
  }

  void saveConsulta(PetConsulta consulta) async{
    DbUtil.insertData('consultas', consulta.toMap());
  }
}