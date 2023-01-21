import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int n) {
    int result = n;
    for (int i = 0; i < n; i++) {
      result += i;
    }
    return pow(result, 2);
  }

  num sumOfSquares(int n) {
    num result = n;
    for (int i = 0; i < n; i++) {
      result += pow(i, 2);
    }
    return result;
  }

  num differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
