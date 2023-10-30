import 'package:flutter/material.dart';
import 'package:flutter_my_meals/components/main_drawer.dart';
import 'package:flutter_my_meals/models/settings_model.dart';

typedef SettingsChanged = void Function(SettingsModel settings);

class SettingsScreen extends StatefulWidget {
  final SettingsModel settings;
  final SettingsChanged onSettingsChanged;

  const SettingsScreen(
      {required this.settings, required this.onSettingsChanged, Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final SettingsModel _settings;

  @override
  void initState() {
    _settings = widget.settings;
    super.initState();
  }

  Widget _createSwitch({
    required String title,
    required String subtitel,
    required void Function(bool value) onChanged,
    bool value = false,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitel),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(_settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              'Mexa nas configurações para filtrar as refeições de acordo com as informações abaixo:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _createSwitch(
                  title: 'Sem glúten',
                  subtitel: 'Exibe apenas refeições sem glúten',
                  value: _settings.isGlutenFree,
                  onChanged: (value) => setState(() {
                    _settings.isGlutenFree = value;
                  }),
                ),
                _createSwitch(
                  title: 'Sem lactose',
                  subtitel: 'Exibe apenas refeições sem lactose',
                  value: _settings.isLactoseFree,
                  onChanged: (value) => setState(() {
                    _settings.isLactoseFree = value;
                  }),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitel: 'Exibe apenas refeições veganas',
                  value: _settings.isVegan,
                  onChanged: (value) => setState(() {
                    _settings.isVegan = value;
                  }),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitel: 'Exibe apenas refeições vegetarianas',
                  value: _settings.isVegetarian,
                  onChanged: (value) => setState(() {
                    _settings.isVegetarian = value;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
