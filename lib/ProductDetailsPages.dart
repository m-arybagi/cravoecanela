import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price; // Garantido que é double
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
        backgroundColor: const Color.fromARGB(255, 218, 121, 153), // Cor do AppBar corrigida
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do produto
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Título do produto
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
            // Preço do produto
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
            // Descrição do produto
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16),
            // Botão de finalizar compra
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simulação de finalização de compra
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text('Compra Concluída!'),
                      content: Text('Obrigado por comprar conosco!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 218, 121, 153),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Finalizar Compra'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
