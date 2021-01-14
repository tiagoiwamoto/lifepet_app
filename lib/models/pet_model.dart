class Pet {

  String nome;
  String imageUrl;
  String descricao;
  int idade;
  String sexo;
  String cor;
  String bio;
  String id;

  Pet(
      { this.nome, this.imageUrl, this.descricao, this.idade,
        this.sexo, this.cor, this.bio, this.id });

}

var pets = [
  Pet(
      nome: "Toichi",
      imageUrl: "assets/images/toichi.jpg",
      descricao: "Cachorro york",
      idade: 8,
      sexo: "Macho",
      cor: "Branco",
      bio: "Cachorra muito ciumento",
      id: "1"),
  Pet(
      nome: "Mika",
      imageUrl: "assets/images/mika.jpg",
      descricao: "Cachorro york",
      idade: 3,
      sexo: "Femea",
      cor: "Branco",
      bio: "Cachorro muito levada",
      id: "2"),
  Pet(
      nome: "Thor Tornado",
      imageUrl: "assets/images/thor.jpg",
      descricao: "Cachorro da laiz e luis",
      idade: 1,
      sexo: "Macho",
      cor: "Cinza",
      bio: "Cachorro muito brabo",
      id: "3"),
  Pet(
      nome: "Melissa Manuela",
      imageUrl: "assets/images/melissa.jpg",
      descricao: "Cachorra da Rose",
      idade: 5,
      sexo: "Femea",
      cor: "Branco",
      bio: "Cachorra muito mimada",
      id: "4"),
];