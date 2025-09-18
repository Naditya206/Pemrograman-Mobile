void main() {
  // Kasus 1: login sebagai Manager
  var login = 'Manager';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print("login = Manager → $nav2");

  // Kasus 2: login sebagai Admin
  login = 'Admin';
  nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print("login = Admin → $nav2");

  // Kasus 3: login sebagai User biasa
  login = 'User';
  nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print("login = User → $nav2");
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  
print(listOfStrings);

}
