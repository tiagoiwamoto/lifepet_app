import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/home/home_screen.dart';
import 'package:lifepet_app/services/pet_service.dart';

class FormEditarPetScreen extends StatefulWidget {
  int id;

  FormEditarPetScreen({this.id});

  @override
  _FormEditarPetScreenState createState() => _FormEditarPetScreenState();
}

class _FormEditarPetScreenState extends State<FormEditarPetScreen> {
  PetService service = PetService();
  Pet pet;
  String _tmpCorPet;
  String _tmpSexoPet;
  String _newCorPet;
  String _newSexoPet;
  final _nomeController = TextEditingController();
  final _bioController = TextEditingController();
  final _idadeController = TextEditingController();
  final _descricaoController = TextEditingController();
  Future<Pet> _loadPet;


  @override
  void initState() {
    super.initState();
    _loadPet = _getPet(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadPet,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          pet = snapshot.data;
          _nomeController.text = pet.nome;
          _bioController.text = pet.bio;
          _idadeController.text = pet.idade.toString();
          _descricaoController.text = pet.descricao;
          _tmpCorPet = pet.cor;
          _tmpSexoPet = pet.sexo;
          return Scaffold(
            appBar: AppBar(
              title: Text("Edição do pet"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: _nomeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Nome do pet"),
                      ),
                      TextFormField(
                        controller: _bioController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Bio"),
                      ),
                      TextFormField(
                        controller: _idadeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "Idade"),
                      ),
                      DropdownButtonFormField(
                        value: _tmpSexoPet,
                        onChanged: (String sexoSelecionado) {
                          setState(() {
                            _newSexoPet = sexoSelecionado;
                          });
                        },
                        items: <String>['Macho', 'Fêmea'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(value: value, child: Text(value));
                        }).toList(),
                      ),
                      TextFormField(
                        controller: _descricaoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Descrição"),
                      ),
                      DropdownButtonFormField(
                        value: _tmpCorPet,
                        onChanged: (String corSelecionada) {
                          setState(() {
                            _newCorPet = corSelecionada;
                          });
                        },
                        items: <String>['Branco', 'Preto', 'Marrom', 'Amarelo']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(value: value, child: Text(value));
                        }).toList(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Pet newPet = Pet(
                                  id: pet.id,
                                  nome: _nomeController.text,
                                  bio: _bioController.text,
                                  idade: int.parse(_idadeController.text),
                                  sexo: _newSexoPet == null ? _tmpSexoPet : _newSexoPet,
                                  descricao: _descricaoController.text,
                                  cor: _newCorPet == null ? _tmpCorPet : _newCorPet);
                              service.editPet(newPet.id, newPet);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => HomeScreen()),
                              );
                            },
                            color: Colors.redAccent,
                            child: Text("Salvar", style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<Pet> _getPet(int id) async {
    return await service.getPet(id);
  }
}
