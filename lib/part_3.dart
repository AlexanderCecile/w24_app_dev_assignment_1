import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
      body: <Widget>[
        const Center(child: Text('Waterfall')),
        const SearchScreen(),
        const SettingsScreen()
      ][currentPageIndex],
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Row(
        children: [
          Expanded(
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
          ),
          Expanded(
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          ),
          Expanded(
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.umbrella)),
          )
        ],
      )),
      Expanded(
          child: Row(
        children: [
          Expanded(
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.face)),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.catching_pokemon)),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.g_translate)),
          )
        ],
      )),
      Expanded(
          child: Row(
        children: [
          Expanded(
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.hail)),
          ),
          Expanded(
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.earbuds)),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.javascript)),
          )
        ],
      ))
    ]);
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedInputUnit = 'Fahrenheit';

  int inputTemperatureValue = 0;
  int convertedTemp = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
        decoration: const InputDecoration(labelText: 'Enter temperature'),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (String input) {
          setState(() {
            inputTemperatureValue = int.parse(input);
            if (selectedInputUnit == 'Fahrenheit') {
              convertedTemp = fahrenheitToCelsius(inputTemperatureValue);
            } else if (selectedInputUnit == 'Celsius') {
              convertedTemp = celsiusToFahrenheit(inputTemperatureValue);
            }
          });
        },
      ),
      const Text('Select unit of input temperature'),
      SegmentedButton(
          segments: const [
            ButtonSegment(value: 'Fahrenheit', label: Text('\u{2109}')),
            ButtonSegment(value: 'Celsius', label: Text('\u{2103}'))
          ],
          selected: {
            selectedInputUnit
          },
          onSelectionChanged: (Set<String> selection) {
            setState(() {
              selectedInputUnit = selection.first;
              if (selectedInputUnit == 'Fahrenheit') {
                convertedTemp = fahrenheitToCelsius(inputTemperatureValue);
              } else if (selectedInputUnit == 'Celsius') {
                convertedTemp = celsiusToFahrenheit(inputTemperatureValue);
              }
            });
          }),
      Text('Conversion result: $convertedTemp')
    ]);
  }
}

int fahrenheitToCelsius(int val) {
  return (val - 32) * 5 ~/ 9;
}

int celsiusToFahrenheit(int val) {
  return val * 9 ~/ 5 + 32;
}
