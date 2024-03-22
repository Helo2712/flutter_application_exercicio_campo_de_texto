import 'package:flutter/material.dart';

class MyOperacao extends StatefulWidget {
  const MyOperacao({Key? key}) : super(key: key);

  @override
  State<MyOperacao> createState() => _MyOperacaoState();
}

class _MyOperacaoState extends State<MyOperacao> {
  TextEditingController controladorTexto = TextEditingController();
  TextEditingController controladorTexto2 = TextEditingController();
  String textoDigitado = "";
  String textoDigitado2 = "";
  String resultado = "";

  void realizarOperacao(String operador) {
    double valor1 = double.tryParse(controladorTexto.text) ?? 0;
    double valor2 = double.tryParse(controladorTexto2.text) ?? 0;

    double resultadoOperacao = 0;

    switch (operador) {
      case '+':
        resultadoOperacao = valor1 + valor2;
        break;
      case '-':
        resultadoOperacao = valor1 - valor2;
        break;
      case '*':
        resultadoOperacao = valor1 * valor2;
        break;
      case '/':
        resultadoOperacao = valor1 / valor2;
        break;
      default:
        resultadoOperacao = 0;
    }

    setState(() {
      resultado = resultadoOperacao.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Operações"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(height: 50),
            const Text("Operações:"),
            SizedBox(height: 20),
            TextField(
              controller: controladorTexto,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Digite o 1 valor",
                filled: true,
                fillColor: const Color.fromARGB(255, 204, 200, 200),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controladorTexto2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Digite o 2 valor",
                filled: true,
                fillColor: const Color.fromARGB(255, 204, 200, 200),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => realizarOperacao("+"),
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => realizarOperacao("-"),
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => realizarOperacao("*"),
                  child: const Text("*"),
                ),
                ElevatedButton(
                  onPressed: () => realizarOperacao("/"),
                  child: const Text("/"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      resultado = "";
                      controladorTexto.clear();
                      controladorTexto2.clear();
                    });
                  },
                  child: const Text("CE"),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text("Resultado: $resultado"),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyOperacao(),
  ));
}
