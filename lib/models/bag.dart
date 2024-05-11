class Bag {
  String name;
  String imagePath;

  Bag({
    required this.name,
    required this.imagePath,
  });
}

List<Bag> listOfBags() {
  return [
    Bag(name: "MOON  \n 35.000", imagePath: "moon.png"),
    Bag(name: "Basica \n 27.000", imagePath: "basicas.png"),
    Bag(name: "Versace \n 35.000", imagePath: "versace.png"),
    Bag(name: "Glam \n 35.000", imagePath: "glam.png"),
    Bag(name: "Blanca chic \n 27.000", imagePath: "chic.png"),
    
  ];
}
