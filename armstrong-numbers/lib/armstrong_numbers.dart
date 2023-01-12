import 'dart:math';

class ArmstrongNumbers {

  bool isArmstrongNumber(String number){
    int length = number.length;
    int total = 0;

    for (int i=0; i<length; i++){
        int equivalent_num = int.parse(number.substring(i, i+1));
        total += pow(equivalent_num, length).toInt();
    }

    String str_total = total.toString();
    if (str_total==number){
        return true;
    }
    return false;
    
  }
}
