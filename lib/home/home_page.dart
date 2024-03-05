import 'package:calculator/home/widgets/button.dart';
import 'package:calculator/models/operation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Operation? operation;
  String? firstNumber;
  String? secondNumber;
  double? result;

  void clear() {
    setState(() {
      operation = null;
      firstNumber = null;
      secondNumber = null;
      result = null;
    });
  }

  void setDigit(int digit) {
    setState(() {
      if (operation == null) {
        firstNumber = '${firstNumber ?? ''}$digit';
      } else {
        secondNumber = '${secondNumber ?? ''}$digit';
      }
    });
  }

  double parse(String? string) => double.parse(string ?? '0');

  void calculate() {
    setState(() {
      if (operation != null) {
        switch (operation!) {
          case Operation.addition:
            result = parse(firstNumber) + parse(secondNumber);
          case Operation.subtraction:
            result = parse(firstNumber) - parse(secondNumber);
          case Operation.division:
            result = parse(firstNumber) / parse(secondNumber);
          case Operation.multiplication:
            result = parse(firstNumber) * parse(secondNumber);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${result ?? secondNumber ?? firstNumber ?? '0'}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
                Button(
                  title: 'C',
                  color: Theme.of(context).colorScheme.tertiary,
                  onPressed: clear,
                ),
                Button(
                  title: '',
                  color: Theme.of(context).colorScheme.tertiary,
                  onPressed: () {},
                ),
                Button(
                  title: '',
                  color: Theme.of(context).colorScheme.tertiary,
                  onPressed: () {},
                ),
                Button(
                  title: '/',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    operation = Operation.division;
                  },
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  title: '7',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(7);
                  },
                ),
                Button(
                  title: '8',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(8);
                  },
                ),
                Button(
                  title: '9',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(9);
                  },
                ),
                Button(
                  title: '*',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    operation = Operation.multiplication;
                  },
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  title: '4',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(4);
                  },
                ),
                Button(
                  title: '5',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(5);
                  },
                ),
                Button(
                  title: '6',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(6);
                  },
                ),
                Button(
                  title: '-',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    operation = Operation.subtraction;
                  },
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  title: '1',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(1);
                  },
                ),
                Button(
                  title: '2',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(2);
                  },
                ),
                Button(
                  title: '3',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    setDigit(3);
                  },
                ),
                Button(
                  title: '+',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    operation = Operation.addition;
                  },
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  title: '0',
                  color: Theme.of(context).colorScheme.secondary,
                  flex: 2,
                  onPressed: () {
                    setDigit(0);
                  },
                ),
                Button(
                  title: ',',
                  color: Theme.of(context).colorScheme.tertiary,
                  onPressed: () {},
                ),
                Button(
                  title: '=',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: calculate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
