import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/home/home_screen.dart';
import 'package:lifepet_app/services/pet_service.dart';

class FormPetScreen extends StatefulWidget {

  @override
  _FormPetScreenState createState() => _FormPetScreenState();

}

class _FormPetScreenState extends State<FormPetScreen> {

  PetService service = PetService();
  Pet pet;
  String tmpCorPet = 'Branco';
  String tmpSexoPet = 'Macho';
  final _nomeController = TextEditingController();
  final _bioController = TextEditingController();
  final _idadeController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do pet"),
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
                  value: tmpSexoPet,
                  onChanged: (String sexoSelecionado) {
                    setState(() {
                      tmpSexoPet = sexoSelecionado;
                    });
                  },
                  items: <String>['Macho', 'Fêmea'].map<DropdownMenuItem<String>>
                    ((String value) {
                    return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value)
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _descricaoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Descrição"),
                ),
                DropdownButtonFormField(
                  value: tmpCorPet,
                  onChanged: (String corSelecionada) {
                    setState(() {
                      tmpCorPet = corSelecionada;
                    });
                  },
                  items: <String>['Branco', 'Preto', 'Marrom', 'Amarelo'].map<DropdownMenuItem<String>>
                    ((String value) {
                    return DropdownMenuItem<String> (
                      value: value,
                      child: Text(value)
                    );
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
                          nome: _nomeController.text,
                          bio: _bioController.text,
                          idade: int.parse(_idadeController.text),
                          sexo: tmpSexoPet,
                          descricao: _descricaoController.text,
                          cor: tmpCorPet
                        );
                        service.addPet(newPet);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => HomeScreen()
                          ),
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
  }
}
