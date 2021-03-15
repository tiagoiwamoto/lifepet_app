import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_consulta_model.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/consulta_pet/consulta_screen.dart';
import 'package:lifepet_app/services/pet_consulta_service.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/app_bar_widget.dart';

class FormConsultaPetScreen extends StatefulWidget {

  final int id;

  FormConsultaPetScreen({this.id});

  @override
  _FormConsultaPetScreenState createState() => _FormConsultaPetScreenState();

}

class _FormConsultaPetScreenState extends State<FormConsultaPetScreen> {

  Pet pet;
  PetConsulta petConsulta;
  final PetService petService = PetService();
  final PetConsultaService petConsultaService = PetConsultaService();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _dataController = TextEditingController();
  Future<Pet> _loadPet;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPet = _getPet(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadPet,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          pet = snapshot.data;
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
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _dataController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(labelText: selectedDate.toString()),
                          ),
                        ),
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
                                  pet: pet.id,
                                  nome: _nomeController.text,
                                  data: selectedDate.toString(),
                                  descricao: _descricaoController.text
                              );
                              petConsultaService.saveConsulta(novaConsulta);
                              // petConsultaService.saveConsultaOnFile(novaConsulta);
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
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  Future<Pet> _getPet(int id) async {
    return await petService.getPet(id);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime dataSelecionada = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2099, 12));
    if(dataSelecionada != null && dataSelecionada != selectedDate){
      setState(() {
        selectedDate = dataSelecionada;
      });
    }
  }
}
