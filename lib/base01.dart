// Importa o framework Flutter
import 'package:flutter/material.dart';

// Método "main()" do Dart
void main() {
  // Executa o aplicativo pelo Flutter
  runApp(const MyApp());
}

// Classe principal do aplicativo Flutter
// Faz configurações e predefinições
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget (objeto) principal
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Nome do aplicativo é definido no "slot" 'title:'
      // ↓ Isso é um "slot"!
      title: 'Olá Mundo!',

      // Tema do aplicativo
      // Pesquise a documentação de `ThemeData()`
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Rota da página inicial do aplicativo
      initialRoute: '/',

      // Definição das rotas (páginas do aplicativo)
      routes: {
        '/': (context) => const Home(),
        '/test': (context) => const Test(),
        '/contatos': (context) => const Contatos(),
      },
    );
  }
}

// Página inicial
class Home extends StatelessWidget {
  // Construtor
  const Home({super.key});

  // Método da página inicial (View)
  @override
  Widget build(BuildContext context) {
    // Scaffold é o widget principal
    // TUDO fica dentro dele
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        // Título e estilos da barra superior
        title: Text(
          'Olá Flutter',
          style: TextStyle(
            // color: Colors.yellow[50],
            fontWeight: FontWeight.bold,
          ),
        ),

        // Cor da barra
        backgroundColor: Colors.green,

        // Centraliza o conteúdo
        centerTitle: true,

        // Cor do conteúdo (texto)
        foregroundColor: Colors.white,
      ),

      // Conteúdo principal
      body: const Text('Conteúdo de Olá Mundo!'),

      // Menu lateral (opcional)
      drawer: Drawer(
        // widget do menu lateral
        // https://docs.flutter.dev/cookbook/design/drawer
        child: ListView(
          padding: EdgeInsets.zero, // OBRIGATÓRIO
          children: [
            // Cabeçalho do menu (opcional)
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu principal'),
            ),

            // Item do menu
            ListTile(
              // Texto do item
              title: const Text('Página inicial'),

              // Quando clicar / tocar
              onTap: () {
                // Fecha o menu ao clicar em um item
                Navigator.pop(context);

                // Abre a página. Ex. Home()
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),

            // Item do menu
            ListTile(
              title: const Text('Página de teste'),
              onTap: () {
                // Fecha o menu ao clicar em um item
                Navigator.pop(context);

                // Navega até a página/rota usando o widget Test()
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
            ),

            // Linha de divisão
            Divider(),

            // Item do menu
            ListTile(
              title: const Text('Faça contato'),
              onTap: () {
                // Fecha o menu ao clicar em um item
                Navigator.pop(context);

                // Navega até a página/rota usando a rota "/contatos"
                Navigator.pushNamed(context, '/contatos');
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contatos()),
                );
               */
              },
            ),
          ],
        ),
      ),

      // Rodapé (opcional)
      bottomNavigationBar: const Text('Rodapé de Hello World!'),
    );
  }
}

// Página '/test'
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página de Teste')),
      body: const Center(child: Text('Conteúdo central de teste')),
      bottomNavigationBar: const Row(
        children: [Text('Isso'), Text('aquilo'), Text('Aquilo outro')],
      ),
    );
  }
}

// Página '/contatos'
class Contatos extends StatelessWidget {
  const Contatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Faça Contatos')),
      body: const Center(child: Text('Conteúdo da página de contatos')),
      bottomNavigationBar: const Row(
        children: [Text("coluna 1"), Text("Coluna 2"), Text("Coluna 3")],
      ),
    );
  }
}
