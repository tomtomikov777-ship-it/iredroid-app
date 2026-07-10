import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Здесь будет ваша логика ИК-отправки и список устройств
  // Для примера показываем интерфейс с кнопками

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.selectDevice),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Действие включения
              },
              child: Text(l10n.power),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(l10n.volumeUp),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(l10n.volumeDown),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
