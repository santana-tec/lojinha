import 'package:intl/intl.dart';
class UtilsServices{


// R$ Valor

 String priceToCurency(double price){
    final numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }
}




