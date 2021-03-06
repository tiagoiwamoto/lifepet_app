import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_anotacao.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/anotacao_pet/anotacao_screen.dart';
import 'package:lifepet_app/services/pet_anotacao_service.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/app_bar_widget.dart';

class FormAnotacaoScreen extends StatelessWidget {

  Pet pet;
  PetAnotacao petAnotacao;
  final String id;
  final PetService petService = PetService();
  final PetAnotacaoService petAnotacaoService = PetAnotacaoService();
  final _anotacaoController = TextEditingController();
  final _tagsController = TextEditingController();


  FormAnotacaoScreen({this.id}){
    _getPet(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(text: "Anotações do ${pet.nome}").build(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _anotacaoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Anotação"),
                ),
                TextFormField(
                  controller: _tagsController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Tags"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        PetAnotacao novaAnotacao = PetAnotacao(
                            pet: pet,
                            anotacao: _anotacaoController.text,
                            tags: _tagsController.text
                        );
                        petAnotacaoService.saveAnotacao(novaAnotacao);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => AnotacaoScreen(id: pet.id.toString())
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
