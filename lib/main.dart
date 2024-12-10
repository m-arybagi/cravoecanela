import 'package:flutter/material.dart';
import 'main.dart'; // Certifique-se de importar o arquivo correto da MainPage.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cravo e Canela',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MainPage(),
    );
  }
}


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cravo e Canela - Maquiagens'),
        backgroundColor: const Color.fromARGB(255, 218, 121, 153),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              // Navegar para a página de login
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem promocional
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://oceane.vtexassets.com/assets/vtex.file-manager-graphql/images/4ba66eeb-156a-4072-b850-8013c4779f21___ff8ce47da2875b5812dee622e369bfdc.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Título de boas-vindas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bem-vindo à Semana do Cliente!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[900],
                ),
              ),
            ),
            // Lista de produtos
            Column(
              children: [
                ProductCard(
                  title: 'Base Líquida',
                  subtitle: 'Com acabamento matte',
                  imageUrl:
                      'https://oceane.vtexassets.com/arquivos/ids/204409-800-800?v=638327993865700000&width=800&height=800&aspect=true',
                  price: 79.90,
                  description:
                      'Base líquida com acabamento matte, perfeita para uma cobertura uniforme e natural.',
                ),
                ProductCard(
                  title: 'Máscara de Cílios',
                  subtitle: 'Volume e alongamento',
                  imageUrl:
                      'https://oceane.vtexassets.com/arquivos/ids/202456/AP2001060C001_mascara_para_cilios_preta_drama_lash_oceane_edition_3.jpg?v=638176124911930000',
                  price: 49.90,
                  description:
                      'Máscara de cílios que proporciona volume e alongamento, destacando seus olhos de forma marcante.',
                ),
                ProductCard(
                  title: 'Batom Matte',
                  subtitle: 'Acabamento perfeito',
                  imageUrl:
                      'https://oceane.vtexassets.com/arquivos/ids/204972/AP2001152CR157F_batom_the_lipstick_oceane_edition_sienna_nude_2.jpg?v=638351390562030000',
                  price: 39.90,
                  description:
                      'Batom matte com longa duração e acabamento impecável. Disponível em diversas cores.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Classe ProductCard para exibir os produtos
class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price;
  final String description;

  const ProductCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text('R\$ $price', style: TextStyle(color: Colors.pink[700])),
        onTap: () {
          // Navegar para a página de detalhes do produto
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                title: title,
                imageUrl: imageUrl,
                price: price,
                description: description,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Página de Login
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 218, 121, 153),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navegar para a página principal
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 218, 121, 153),
                padding: const EdgeInsets.all(16),
              ),
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Página de Detalhes do Produto
class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  const ProductDetailsPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 218, 121, 153),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'R\$ $price',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.pink[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

