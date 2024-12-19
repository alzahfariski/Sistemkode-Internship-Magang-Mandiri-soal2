import 'package:get/get.dart';

class SalaryController extends GetxController {
  var workingHours = 0.0.obs;
  var hourlyRate = 0.0.obs;
  var regularSalary = 0.0.obs;
  var overtimeSalary = 0.0.obs;
  var totalSalary = 0.0.obs;

  void calculateSalary() {
    double regularHours = workingHours.value > 40 ? 40 : workingHours.value;
    double overtimeHours = workingHours.value > 40 ? workingHours.value - 40 : 0;

    regularSalary.value = regularHours * hourlyRate.value;
    overtimeSalary.value = overtimeHours * (hourlyRate.value * 1.5);
    totalSalary.value = regularSalary.value + overtimeSalary.value;
  }

  void reset() {
    workingHours.value = 0;
    hourlyRate.value = 0;
    regularSalary.value = 0;
    overtimeSalary.value = 0;
    totalSalary.value = 0;
  }
}