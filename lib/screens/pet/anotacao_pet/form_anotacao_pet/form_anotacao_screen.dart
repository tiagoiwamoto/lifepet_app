import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_anotacao.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/pet/anotacao_pet/anotacao_screen.dart';
import 'package:lifepet_app/services/pet_anotacao_service.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/screens/components/app_bar_widget.dart';

class FormAnotacaoScreen extends StatefulWidget {

  final int id;

  FormAnotacaoScreen({this.id});

  @override
  _FormAnotacaoScreenState createState() => _FormAnotacaoScreenState();
}

class _FormAnotacaoScreenState extends State<FormAnotacaoScreen> {

  Pet pet;
  PetAnotacao petAnotacao;
  final PetService petService = PetService();
  final PetAnotacaoService petAnotacaoService = PetAnotacaoService();
  final _anotacaoController = TextEditingController();
  final _tagsController = TextEditingController();
  Future<Pet> _loadPet;

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
                                  pet: pet.id,
                                  anotacao: _anotacaoController.text,
                                  tags: _tagsController.text
                              );
                              petAnotacaoService.saveAnotacao(novaAnotacao);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => AnotacaoScreen(id: pet.id)
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
}
