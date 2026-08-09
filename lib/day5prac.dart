//week 1 revision,employee bonus calculator

//Your task is to write a program that stores a list of employees and calculates their annual bonus based on their role and years of experience.

//Every employee gets a base bonus of 5% of their salary.

//If the employee has more than 3 years of experience, their bonus bumps up to 10%.

//If the employee's role is strictly "Manager", they get an additional flat ₹5000 //added on top of whatever percentage they earned.

class Employee{
  String name;
  String role;
  double salary;
  int yearsOfExperience;
  Employee({required this.name, required this.role, required this.salary, required this.yearsOfExperience});
}


void main(){
  List<Employee> team = [
    Employee(name: "Aisha", role: "Developer", salary: 50000, yearsOfExperience: 2),
    Employee(name: "Vikram", role: "Manager", salary: 80000, yearsOfExperience: 5),
    Employee(name: "Rohan", role: "Designer", salary: 45000, yearsOfExperience: 4),

  ];

  void processBonuses() {

    // YOUR TURN:
    // 1. Write a for-in loop to go through the 'team' list.
    // 2. Create a variable inside the loop called 'bonus' and start it at 0.0.
    // 3. Write your if/else statements to calculate the percentage based on experience.
    // 4. Write another if statement to check if the role == "Manager" and add 5000.
    // 5. Print a final message: "[Name] earned a bonus of ₹[bonus]"
    for(Employee current in team){
      double bonus = 0.0;
      if (current.yearsOfExperience > 3) {
        bonus = current.salary * 0.10; // 10% for > 3 years
      } else {
        bonus = current.salary * 0.05; // 5% base bonus
      }
      if(current.role == 'Manager'){
        bonus+=5000;
      }
      print('${current.name} earned a bonus of $bonus');
    }

  }

  print('Annual Bonus Report');
  processBonuses();

}