import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';

/*
          Hero(tag: pet.id, child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(pet.imageUrl), fit: BoxFit.cover)
            ),
          ))
 */
class HeroBuilder extends StatelessWidget {
  final String id;
  final String image;

  HeroBuilder({this.id, this.image});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: id,
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ));
  }
}
