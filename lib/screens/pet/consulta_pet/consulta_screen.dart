import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/pet/consulta_pet/form_consulta_pet/form_consulta_screen.dart';
import 'package:lifepet_app/services/pet_consulta_service.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/screens/components/back_home.dart';
import 'package:lifepet_app/screens/components/custom_navbar.dart';
import 'package:lifepet_app/screens/components/hero_builder.dart';
import 'package:lifepet_app/screens/components/pet_text_style.dart';

class ConsultaScreen extends StatefulWidget {

  final int id;

  ConsultaScreen({this.id});

  @override
  _ConsultaScreenState createState() => _ConsultaScreenState();

}

class _ConsultaScreenState extends State<ConsultaScreen> {

  final PetService petService = PetService();
  final PetConsultaService petConsultaService = PetConsultaService();
  Pet pet;
  List<PetConsulta> consultas = List();
  Future<Pet> _loadPet;
  Future<List<PetConsulta>> _loadConsultas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPet = _getPet(widget.id);
    _loadConsultas = _getConsultas(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadPet,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          pet = snapshot.data;
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    HeroBuilder(id: pet.id.toString(), image: pet.imageUrl),
                    BackHome()
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [PetTextStyle(text: "Consultas", type: "header")],
                    )),
                FutureBuilder(
                  future: _loadConsultas,
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      consultas = snapshot.data;
                      if(consultas.isEmpty){
                        return Center(
                          child: Text("Este pet não possui consultas"),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: consultas.length,
                            itemBuilder: (context, index) {
                              return _consultaCard(context, index);
                            }),
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => FormConsultaPetScreen(id: pet.id)),
                );
              },
              child: Icon(
                Icons.add,
              ),
              backgroundColor: Colors.indigo,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomNavbar(pet: pet, paginaAberta: 2),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<Pet> _getPet(int id) async {
    return await petService.getPet(id);
  }

  Future<List<PetConsulta>> _getConsultas(int id) async {
    return await petConsultaService.getConsultasPet(id);
    // return await petConsultaService.getConsultasPetFromFile(id);
  }

  Widget _consultaCard(BuildContext context, int index) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1.0, color: Colors.redAccent))),
          child: Icon(Icons.assignment_rounded, color: Colors.redAccent),
        ),
        title: Text(
          consultas[index].nome,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          """
${consultas[index].descricao}
${consultas[index].data}
          """
        ),
      ),
    );
  }
}
