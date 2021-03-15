import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/pet/form_pet/form_pet_screen.dart';
import 'package:lifepet_app/screens/home/components/pet_card.dart';
import 'package:lifepet_app/services/pet_service.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  PetService service = PetService();
  List<Pet> pets = List();
  Future<List> _loadPets;

  @override
  void initState() {
    _loadPets = _getAllPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadPets,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          pets = snapshot.data;
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
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List> _getAllPets() async {
    return await service.getAllPets();
  }
}
