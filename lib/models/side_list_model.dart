class SideMenu {
  String? name;

  SideMenu({
    required this.name,
  });

  static List<SideMenu> mySideMenu = [
    SideMenu(name: 'Cappuccino'),
    SideMenu(name: 'Latte'),
    SideMenu(name: 'Americano'),
    SideMenu(name: 'Espresso'),
    SideMenu(name: 'Flat White'),
  ];
}