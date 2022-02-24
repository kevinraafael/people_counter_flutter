// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Pacote que traz todos os itens do material

void main() {
  runApp(const MyApp());
} //  A primeira função que é chamada no  DART ,
/*o primeiro parâmetro eu informo o widget que quero passar , no caso o My APp
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override // Estamos sobrescrevendo o método widget classe statellesWidget
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  void decrement() {
    setState(() {
      count--;
    });
    /*
    o Set state permite essa alteração de estado da tela , dessa forma TODA A TELA
    É REFEITA , quando for decrementado
    */
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });

    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/restaurant.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.center,
          // Alinhamento de eixo principal verticial
          children: [
            Text(
              isFull ? 'Está lotado!' : 'Pode Entrar',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                32,
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(
                      100,
                      100,
                    ),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        24,
                      ),
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(
                        100,
                        100,
                      ),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          24,
                        ),
                      )),
                  child: Text('Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//stless  atalho para criar  o statelles widget


/*
Widget padding permite com que você dê espaçamento entre os widgets
os widgets filhos sempre aparecem em cima do pai , por isso o texto e botão
ficam em cima da imagem.
---Alterando o estado do contador ---
    1 - Precisamos estar usando o wiget Stateful (widget com estado, possui um 
    estado interno que pode ser alterado), pois esse é com estado
---Stateless e Stateful
  Stateless: 
    Widget  sem estado , não há mudanças na tela. Uma vez criado o widget 'ele morre daquela forma'
  Stateful:
    Permite mudanças de estado , exemplo do contador
*/
