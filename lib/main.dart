import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _imageApp = AssetImage('img/padrao.png');
  var _texto = "Escola uma opção abaixo !";

  void _opcaoSelecionada(String usuario) {
    var opcao = ["pedra", "papel", "tesoura"];
    var numeros = Random().nextInt(3);
    var escolhaApp = opcao[numeros];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage('img/pedro.png');
        });
        break;
      case "papel":
        setState(() {
          this._imageApp = AssetImage('img/papel.png');
        });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage('img/tesoura.png');
        });
        break;
    }

    if ((usuario == "pedra" && escolhaApp == "tesoura") ||
        (usuario == "tesoura" && escolhaApp == "papel") ||
        (usuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._texto = "Você GANHOU";
      });
    } else if ((escolhaApp == "pedra" && usuario == "tesoura") ||
        (escolhaApp == "papel" && usuario == "pedra") ||
        (escolhaApp == "tesoura" && usuario == "papel")) {
      setState(() {
        this._texto = "Você PERDEU";
      });
    } else {
      setState(() {
        this._texto = "EMPATADO";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpo'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  bottom: 30,
                ),
                child: Text(
                  "Escolha do App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(
                image: this._imageApp,
                width: 90,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 60,
                  bottom: 10,
                ),
                child: Text(this._texto),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset(
                      'img/pedra.png',
                      height: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset(
                      'img/papel.png',
                      height: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset(
                      'img/tesoura.png',
                      height: 80,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
