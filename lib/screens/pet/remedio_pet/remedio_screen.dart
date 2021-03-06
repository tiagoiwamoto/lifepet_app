import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/models/pet_remedio_model.dart';
import 'package:lifepet_app/screens/pet/remedio_pet/form_remedio_pet/form_remedio_pet_screen.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/services/remedio_service.dart';

import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/components/custom_navbar.dart';

class RemedioScreen extends StatelessWidget {

  final String id;
  List<Remedio> remedioList = List();
  final PetService petService = PetService();
  final RemedioService remedioService = RemedioService();
  Pet pet;

  RemedioScreen({this.id}){
    _getPet(id);
    _getRemedios(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: pet.id,
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(pet.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remédios",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: remedioList.length,
                itemBuilder: (context, index) {
                  return _remedioCard(context, index);
                },
              ),
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => FormRemedioPetScreen(id: pet.id.toString())),
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(pet: pet, paginaAberta: 1),
    );
  }

  Widget _remedioCard(BuildContext context, int index){
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1.0, color: Colors.redAccent)
              )
          ),
          child: Icon(Icons.healing, color: Colors.redAccent),
        ),
        title: Text(
          remedioList[index].nome,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
            remedioList[index].data
        ),
      ),
    );

  }

  void _getPet(String id){
    // pet = petService.getPet(id);
  }

  void _getRemedios(String id){
    remedioList = remedioService.getRemediosPet(id);
  }
}
