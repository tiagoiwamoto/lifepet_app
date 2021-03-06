import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/form_pet/form_pet_screen.dart';
import 'package:lifepet_app/screens/home/components/pet_card.dart';
import 'package:lifepet_app/services/pet_service.dart';

class HomeScreen extends StatelessWidget {

  PetService service = PetService();
  List<Pet> pets = List();

  HomeScreen(){
    _getAllPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return PetCard(pet: pets[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => FormPetScreen()),
            );
          },
          label: Text("Cadastrar"),
          icon: Icon(Icons.pets),
          backgroundColor: Colors.redAccent),
    );
  }

  void _getAllPets(){
    List list = service.getAllPets();
    pets = list;
  }
}
