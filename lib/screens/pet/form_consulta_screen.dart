import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/pet/consulta_screen.dart';
import 'package:lifepet_app/services/pet_consulta_service.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/widgets/app_bar_widget.dart';

class FormConsultaPetScreen extends StatelessWidget {

  Pet pet;
  PetConsulta petConsulta;
  final String id;
  final PetService petService = PetService();
  final PetConsultaService petConsultaService = PetConsultaService();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();


  FormConsultaPetScreen({this.id}){
   _getPet(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppbarWidget(text: "Consultas do ${pet.nome}").build(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome da consulta"),
                ),
                TextFormField(
                  controller: _descricaoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Descrição da consulta"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        PetConsulta novaConsulta = PetConsulta(
                          pet: pet,
                          nome: _nomeController.text,
                          descricao: _descricaoController.text
                        );
                        petConsultaService.saveConsulta(novaConsulta);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ConsultaScreen(id: pet.id)
                          ),
                        );
                      },
                      color: Colors.redAccent,
                      child: Text("Cadastrar", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getPet(String id){
    pet = petService.getPet(id);
  }
}
