import 'package:coffee_app/models/products_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

List <Product> cartItems = [];
bool itemAlreadyInCart = false;

void addToCart(coffeeProduct){
  for(int i=0; i<cartItems.length; i++)
  {
    if(cartItems[i].type == coffeeProduct.type && cartItems[i].name == coffeeProduct.name)
    {
      if(cartItems[i].quantity<9)
      {
        cartItems[i].quantity++;
        Fluttertoast.showToast(
          msg: 'Item Added',
        );
        itemAlreadyInCart = true;
      }
      else
      {
        itemAlreadyInCart = true;
        Fluttertoast.showToast(
          msg: 'Max Amount',
        );
      }
    }
  }
  if(itemAlreadyInCart == false)
  {
    cartItems.add(coffeeProduct);
    Fluttertoast.showToast(
      msg: 'Item Added',
    );
  }
  itemAlreadyInCart = false;
}

double calculateTotal(){
  double totalPrice = 0;
  for(int i=0; i<cartItems.length; i++){
    totalPrice += cartItems[i].quantity * double.parse(cartItems[i].price);
  }
  return totalPrice;
}

double calculateTax(double total){
  double totalTax = total * (12/100);
  return totalTax;
}

double calculateSubtotal(double total, double tax){
  double subtotal = total + tax;
  return subtotal;
}