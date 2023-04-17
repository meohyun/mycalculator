import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycalculator/provider/calculator_provider.dart';

final calculatorNotifierProvider = StateNotifierProvider((ref) {
  return CalculatorProvider();
});

class Calculator extends ConsumerWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorState = ref.watch(calculatorNotifierProvider);
    final calculatorRead = ref.read(calculatorNotifierProvider.notifier);

    List<dynamic> nums = [
      "",
      "0",
      ".",
      "=",
      "1",
      "2",
      "3",
      "+",
      "4",
      "5",
      "6",
      "-",
      "7",
      "8",
      "9",
      "*",
      "C",
      "AC",
      "/",
      "+/-",
      "(",
      ")"
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "계산기",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrangeAccent,
                  border: Border.all(width: 1, color: Colors.deepOrange)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      calculatorRead.userinput,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 20,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      calculatorRead.result,
                      style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView.builder(
                    reverse: true,
                    itemCount: nums.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1 / 0.7,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (BuildContext context, index) {
                      return FloatingActionButton(
                        backgroundColor: Colors.white38,
                        onPressed: () {
                          calculatorRead.handleButtons(nums[index].toString());
                        },
                        heroTag: false,
                        child: Text(
                          "${nums[index]}",
                          style: TextStyle(fontSize: 25, color: Colors.amber),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
