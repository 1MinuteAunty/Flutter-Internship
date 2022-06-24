/**
 * Day 1 (20 Jun 2022)
 * Workout code on https://dartpad.dev/?
 */
void main() {
  //Manipulation with Strings
  String message = "Hello World";
  print(message);

  //Manipulation with numbers  int and double
  int age = 18;
  if (age < 50) {
    print("You are young !");
  } else {
    print("You are Old");
  }

  int days = 15;
  double hoursPerDay = 1.1;
  double totalHours = days * hoursPerDay;
  print("You will be Investing  $totalHours hrs.");
}
