class MySideMenu {
  String? name;

  MySideMenu({
    required this.name,
  });

  static List<MySideMenu> sideMenuList = [
    MySideMenu(name: 'Cappuccino'),
    MySideMenu(name: 'Latte'),
    MySideMenu(name: 'Americano'),
    MySideMenu(name: 'Espresso'),
    MySideMenu(name: 'Flat White'),
  ];
}