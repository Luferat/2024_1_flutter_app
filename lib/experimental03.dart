import 'package:flutter/material.dart';

import 'pages/homepage.dart';
import 'pages/searchpage.dart';
import 'pages/testpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: const AppFrame(),

      routes: {'/page1': (context) => const Page1()},
    );
  }
}

class AppFrame extends StatefulWidget {
  const AppFrame({super.key});

  @override
  State<AppFrame> createState() => _AppFrameState();
}

class _AppFrameState extends State<AppFrame> {
  int _selectedIndex = 0;

  // Abas / páginas - Conteúdo de 'body:'
  final List<Widget> _pages = const [
    HomePage(), // indice [0]
    SearchPage(), // índice [1]
    TestPage(), // índice [2]
  ];

  // Seleciona a página acima conforme o índice e coloca no 'State'
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello World',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('App Name'),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),

            ListTile(
              leading: Icon(Icons.search),
              title: const Text('Busca'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),

            ListTile(
              leading: Icon(Icons.bug_report),
              title: const Text('Página de teste com índice'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),

            ListTile(
              leading: Icon(Icons.bug_report),
              title: const Text('Página de teste com push'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/page1');
              },
            ),
          ],
        ),
      ),

      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        iconSize: 32,
        items: const [
          // Use const for BottomNavigationBarItem if they don't change
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página de Teste BCD',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Text('Conteúdo da página de teste BCD!'),
      bottomNavigationBar: const Text('Rodapé de página de teste BCD!'),
    );
  }
}
