class Items{
  String title ;
  String icon;
  String subtitle;


  Items({
    required this.title, 
    required this.icon, 
    required this.subtitle
    });
}

class DrawerItems{
  final List<Items> items = [ //Lista de elementos del drawer
      Items(
        title: 'Inicio', 
        icon: 'assets/home.png', 
        subtitle: 'Inicio'),
      Items(
        title: 'Marcas', 
        icon: 'assets/brands.png', 
        subtitle: 'Las marcas más cute'),
      Items(
        title: 'Maquillaje', 
        icon: 'assets/makeup.png', 
        subtitle: 'Resalta tu belleza'),
      Items(
        title: 'Skincare', 
        icon: 'assets/skin_care.png', 
        subtitle: 'Piel radiante'),
      Items(
        title: 'Cabello', 
        icon: 'assets/hair.png', 
        subtitle: 'Estilos saludables'),
      Items(
        title: 'Cuidado corporal', 
        icon: 'assets/corporal_care.png', 
        subtitle: 'Piel suave'),
    ];
}
