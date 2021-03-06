import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/anotacao_pet/anotacao_screen.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/consulta_pet/consulta_screen.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/perfil_pet/perfil_pet_screen.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/pet/remedio_pet/remedio_screen.dart';

class CustomNavbar extends StatefulWidget {

  int paginaAberta;
  final Pet pet;


  CustomNavbar({this.pet, this.paginaAberta});

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {

  Widget paginaAtual;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      widget.paginaAberta = 0;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => PerfilPetScreen(id: widget.pet.id),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pets,
                          color: widget.paginaAberta == 0 ? Colors.redAccent : Colors.grey
                      ),
                      Text(
                        "Perfil",
                        style: TextStyle(
                          color: widget.paginaAberta == 0 ? Colors.redAccent : Colors.grey
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      widget.paginaAberta = 1;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => RemedioScreen(id: widget.pet.id.toString()),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.healing,
                          color: widget.paginaAberta == 1 ? Colors.redAccent : Colors.grey
                      ),
                      Text(
                        "Remédio",
                        style: TextStyle(
                            color: widget.paginaAberta == 1 ? Colors.redAccent : Colors.grey
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      widget.paginaAberta = 2;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => ConsultaScreen(id: widget.pet.id.toString()),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital,
                          color: widget.paginaAberta == 2 ? Colors.redAccent : Colors.grey
                      ),
                      Text(
                        "Consulta",
                        style: TextStyle(
                            color: widget.paginaAberta == 2 ? Colors.redAccent : Colors.grey
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      widget.paginaAberta = 3;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => AnotacaoScreen(id: widget.pet.id.toString()),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_note,
                          color: widget.paginaAberta == 3 ? Colors.redAccent : Colors.grey
                      ),
                      Text(
                        "Anotações",
                        style: TextStyle(
                            color: widget.paginaAberta == 3 ? Colors.redAccent : Colors.grey
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
