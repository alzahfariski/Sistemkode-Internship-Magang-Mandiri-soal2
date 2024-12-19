import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/salary_controller.dart';

class SalaryCalculatorView extends StatelessWidget {
  final SalaryController controller = Get.put(SalaryController());

  SalaryCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Gaji'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jam Kerja',
                border: OutlineInputBorder(),
                hintText: 'Masukkan jumlah jam kerja',
              ),
              onChanged: (value) {
                controller.workingHours.value = double.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tarif per Jam',
                border: OutlineInputBorder(),
                hintText: 'Masukkan tarif per jam',
              ),
              onChanged: (value) {
                controller.hourlyRate.value = double.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                controller.calculateSalary();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Hitung Gaji'),
            ),
            const SizedBox(height: 24),
            Obx(() => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hasil Perhitungan:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                            'Gaji Regular: Rp ${controller.regularSalary.value.toStringAsFixed(2)}'),
                        const SizedBox(height: 8),
                        Text(
                            'Gaji Lembur: Rp ${controller.overtimeSalary.value.toStringAsFixed(2)}'),
                        const Divider(),
                        Text(
                          'Total Gaji: Rp ${controller.totalSalary.value.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                controller.reset();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
