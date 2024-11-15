import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JuegoApp(),
  ));
}

class JuegoApp extends StatefulWidget {
  const JuegoApp({super.key});

  @override
  State<JuegoApp> createState() => _JuegoAppState();
}

class _JuegoAppState extends State<JuegoApp> {
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  int _Cantidad = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cantidad de tableros'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child:Form(
           key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            const Text('Ingrese la cantidad para generar los tableros'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'cantidad de tableros', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una cantidad';
                  }
                  
                  final parsedValue = int.tryParse(value);
                  if (parsedValue == null) {
                    return 'Ingrese un número válido';
                  }
                  
                  _Cantidad = parsedValue; // Asignación correcta después de la conversión
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tableros(cantidad: _Cantidad),
                      ),
                    );
                  }
                },
                child: const Text('Generar'),
              ),
          ],
        ),
        )
      ),
    );
  }
}

class Tableros extends StatelessWidget {
  final int cantidad;

  const Tableros({super.key, required this.cantidad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableros'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: cantidad,
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () async{
                await Navigator.push(context, MaterialPageRoute(builder: (context) => Juego(buttonCount: 6,)));
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tablero ${index + 1} presionado')),
                );
              }, child: Text('Tablero: ${index + 1}'),
            )
          );
          }
        )
      )  
    );    
  }
}

class Juego extends StatefulWidget {
  final int buttonCount;
  const Juego({Key? key, required this.buttonCount}):super (key: key);

  @override
  State<Juego> createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  int balas = 0;
  int tontos = 0;
  int tricas = 0;
  int cuadras = 0;
  int quinas = 0;
  int senas = 0;
  int escalera = 0;
  int full = 0;
  int poker = 0;
  int grande = 0;

  void btbalas() {
    setState(() {
      if (balas >= 5) {
        balas = 0;
      } else {
        balas += 1;
      }
    });
  }

  void bttontos() {
    setState(() {
      if (tontos >= 10) {
        tontos = 0;
      } else {
        tontos += 2;
      }
    });
  }

  void bttricas() {
    setState(() {
      if (tricas >= 15) {
        tricas = 0;
      } else {
        tricas += 3;
      }
    });
  }

  void btcuadras() {
    setState(() {
      if (cuadras >= 20) {
        cuadras = 0;
      } else {
        cuadras += 4;
      }
    });
  }

  void btquinas() {
    setState(() {
      if (quinas >= 25) {
        quinas = 0;
      } else {
        quinas += 5;
      }
    });
  }

  void btsenas() {
    setState(() {
      if (senas >= 30) {
        senas = 0;
      } else {
        senas += 6;
      }
    });
  }

  void btescalera() {
    setState(() {
      if (escalera >= 25) {
        escalera = 0;
      } else if (escalera == 0) {
        escalera += 20;
      } else {
        escalera += 5;
      }
    });
  }

  void btfull() {
    setState(() {
      if (full >= 35) {
        full = 0;
      } else if (full == 0) {
        full += 30;
      } else {
        full += 5;
      }
    });
  }

  void btpoker() {
    setState(() {
      if (poker >= 45) {
        poker = 0;
      } else if (poker == 0) {
        poker += 40;
      } else {
        poker += 5;
      }
    });
  }

  void btgrande() {
    setState(() {
      if (grande >= 50) {
        grande = 0;
      } else {
        grande += 50;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablero de Cacho'),
        backgroundColor: const Color.fromARGB(255, 203, 188, 233),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("bala"),
               ElevatedButton(
                onPressed: () => btbalas(),
                child: Text('$balas'),
              ),
              ],
              ),
              Column(
                children: <Widget>[
                  const Text('escalera'),
                   ElevatedButton(
                onPressed: () => btescalera(),
                child: Text('$escalera'),
              ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text('Cuadras'),
                ElevatedButton(
                onPressed: () => btcuadras(),
                child: Text('$cuadras'),
              )
                ],
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  const Text('Tontos'),
                  ElevatedButton(
                onPressed: () => bttontos(),
                child: Text('$tontos'),
              ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text('Full'),
                   ElevatedButton(
                onPressed: () => btfull(),
                child: Text('$full'),
              ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text('Quinas'),
                  ElevatedButton(
                onPressed: () => btquinas(),
                child: Text('$quinas'),
              )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text('Tricas'),
                  ElevatedButton(
                onPressed: () => bttricas(),
                child: Text('$tricas'),
              ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text('Poker'),
                  ElevatedButton(
                onPressed: () => btpoker(),
                child: Text('$poker'),
              ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text('Senas'),
                  ElevatedButton(
                onPressed: () => btsenas(),
                child: Text('$senas'),
              )
                ],
              ),
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => btgrande(),
                child: Text('$grande'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}