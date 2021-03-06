import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/consulta_pet/form_consulta_pet/form_consulta_screen.dart';
import 'package:lifepet_app/services/pet_consulta_service.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/back_home.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/custom_navbar.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/hero_builder.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/pet_text_style.dart';

class ConsultaScreen extends StatelessWidget {
  final String id;
  final PetService petService = PetService();
  final PetConsultaService petConsultaService = PetConsultaService();
  Pet pet;
  List<PetConsulta> consultas = List();

  ConsultaScreen({this.id}) {
    _getPet(id);
    _getConsultas(id);
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: consultas.length,
                itemBuilder: (context, index) {
                  return _consultaCard(context, index);
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => FormConsultaPetScreen(id: pet.id.toString())),
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
  }

  void _getPet(String id) {
    pet = petService.getPet(id);
  }

  void _getConsultas(String id) {
    consultas = petConsultaService.getConsultasPet(id);
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
        subtitle: Text(consultas[index].descricao),
      ),
    );
  }
}
