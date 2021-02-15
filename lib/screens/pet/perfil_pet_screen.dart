import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/widgets/custom_navbar.dart';

class PerfilPetScreen extends StatelessWidget {

  final Pet pet;

  PerfilPetScreen({this.pet});

  Widget _cartaoInfoPet(String label, String value) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF8F2F7),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.red
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        image: AssetImage(
                          pet.imageUrl
                        ),
                        fit: BoxFit.cover
                      )
                    ),
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
                    pet.nome,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.descricao,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _cartaoInfoPet('Id', pet.id.toString()),
                  _cartaoInfoPet('Idade', pet.idade.toString()),
                  _cartaoInfoPet('Sexo', pet.sexo.toString()),
                  _cartaoInfoPet('Cor', pet.cor.toString()),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Text(
                pet.bio,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  height: 1.5
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
