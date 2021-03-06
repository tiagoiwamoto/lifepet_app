import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_anotacao.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/anotacao_pet/form_anotacao_pet/form_anotacao_screen.dart';
import 'package:lifepet_app/services/pet_anotacao_service.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/back_home.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/custom_navbar.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/hero_builder.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/pet_text_style.dart';

class AnotacaoScreen extends StatelessWidget {
  final String id;
  final PetService petService = PetService();
  final PetAnotacaoService petAnotacaoService = PetAnotacaoService();
  List<PetAnotacao> anotacoes = List();
  Pet pet;

  AnotacaoScreen({this.id}) {
    _getPet(id);
    _getAnotacoes(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              HeroBuilder(id: '1', image: 'assets/images/toichi.jpg'),
              BackHome()
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [PetTextStyle(text: "Anotações", type: "header")],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: anotacoes.length,
                itemBuilder: (context, index) {
                  return _anotacaoCard(context, index);
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => FormAnotacaoScreen(id: pet.id.toString())),
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(pet: pet, paginaAberta: 3),
    );
  }

  Widget _anotacaoCard(BuildContext context, int index) {
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
          child: Icon(Icons.event_note, color: Colors.redAccent),
        ),
        title: Text(
          anotacoes[index].anotacao,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(anotacoes[index].tags),
      ),
    );
  }

  void _getPet(String id) {
    // pet = petService.getPet(id);
  }

  void _getAnotacoes(String id) {
    anotacoes = petAnotacaoService.getAnotacoesPet(id);
  }
}
