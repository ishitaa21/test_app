
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

}
