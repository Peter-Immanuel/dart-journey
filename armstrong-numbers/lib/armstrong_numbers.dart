import 'dart:math';

class ArmstrongNumbers {

  bool isArmstrongNumber(String number){
    int length = number.length;
    int total = 0;

    number.runes.forEach((int rune){
      var equivalent_num = int.parse(new String.fromCharCode(rune));
      total += pow(equivalent_num, length).toInt();
    });

    if (total.toString()==number){
        return true;
    }
    return false;
    
  }
}
