import 'dart:io';
void main(){

  //student details
  String studentName = "Ishita";
  int studentAge = 23;
  String? assignedClasses;
  assignedClasses = "yes assigned";

  print('Student details');
  print('Name: $studentName, age:$studentAge');
  print('Class assigned: ${assignedClasses ?? "unassigned"}');

  //calculator
  int num1 = 15;
  double num2 = 12.8;
  num num3 = 12.99;

  num sum = num1 + num2 + num3;
  num difference = num1 - num2;
  num division = num2 /  num3;
  num multiplication = num3*num1;

  print ('the basic operations are: sum:$sum,difference:$difference,division:$division,product:$multiplication');


  //temperature converter

//double gpa = double.parse(stdin.readLineSync()!);

  double farenheit = 99.9;
  double celsius = (farenheit - 32) * (5/9);

  print('the Farenheit value is $farenheit and its celsius equivalent is $celsius');
  //can also use ${celsius.toStringAsFixed(2)} to reduce the decimal value

  //day 2

    void evenodd(){
      print('enter a number to check');
      int? number = int.parse(stdin.readLineSync()!);
      if(number%2 == 0){
        print('the number $number is even');
      }
      else {
        print('the number $number is odd');
      }
    }
    evenodd();
    void prime(){
      //prime number starts with 2
      //divisible by one and the number itself
      print('enter the number to check prime or not');
      int? number = int.parse(stdin.readLineSync()!);
      if(number <= 1){
        print('not prime');
        return;
      }
      else {
        for (int i = 2; i < number; i++) {
          if (number % i == 0) {
            print('the number $number is not prime');
            return;
          }

        }
        print('the number $number is prime');
      }
    }
    prime();
    void multable(){
      print('enter the number to print its multiplication table:');
      int? number = int.parse(stdin.readLineSync()!);
      for(int i =1;i<=10;i++){
        int mul = number * i;
        print('$number * $i = $mul \n');
      }
    }
    multable();

    void fibo(){
      //one number is the sum of two numbers before
      //0 1 1 2 3 5 8 13...

      int num1=0;
      int num2=1;
      print('enter the number to print its fibonacci table:');
      int? number = int.parse(stdin.readLineSync()!);
      if(number == 0){
        return ;
      }
      else if(number == 1){
        print('$num1'); // If they just want 1 term, print 0 and exit.
        return;
      }
      print('$num1 \n$num2');
      for(int i=2;i<number;i++){
        int num3 = num2+num1;
        num1=num2;
        num2=num3;
        print('$num3');
      }

    }
    fibo();
    //using recursion
  int fibonacci(int n){
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n-1)+ fibonacci(n-2);
  }

  int termsToPrint = 7;
  print('--- Recursive Fibonacci ---');

  // 2. We call it right below where we defined it
  for (int i = 0; i < termsToPrint; i++) {
    print(fibonacci(i));
  }
}


