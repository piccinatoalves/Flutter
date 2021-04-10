import 'package:base/components/Placarjogo.dart';
import 'package:base/components/Resultadojogo.dart';
import 'package:base/repository/PlacarRepository.dart';
import 'package:flutter/material.dart';

List<ResultadoJogo> _resultados = [
  new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
  new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
];

void main() => runApp(MyList());

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar Futebol',
      home: _Lista(),
    );
  }
}

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_Lista> {
  final title = 'Basic List';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            CadastroView(ResultadoJogo.empty())));
                print(_resultados.length);
                setState(() {});
              },
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
              future: PlacarRepository.list(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: new Card(
                          child: PlacarJogo(snapshot.data[index]),
                        ),
                        onTap: () {
                          _showMenuOption(context, snapshot.data[index]);
                        },
                      );
                    });
              }),
        ),
      ),
    );
  }

  void _showMenuOption(BuildContext context, ResultadoJogo resultado) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 200,
            color: Colors.blue[200],
            child: Column(
              children: [
                _button("Editar", context, () async {
                  Navigator.pop(context);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastroView(resultado)));
                  setState(() {});
                }),
                _button("Excluir", context, () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Ola dialog"),
                          content: Text("Ola conent"),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Approve'),
                              onPressed: () {
                                PlacarRepository.delete(resultado.id);
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }),
                _button("fechar", context, () {
                  Navigator.pop(context);
                })
              ],
            ),
          );
        });
  }

  Widget _button(title, context, function) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: FlatButton(
        color: Colors.red,
        child: Text(
          title,
          style: TextStyle(color: Colors.yellow, fontSize: 20.0),
        ),
        onPressed: function,
      ),
    );
  }
}

class ResultadoView extends StatelessWidget {
  final ResultadoJogo _resultadoJogo;

  ResultadoView(this._resultadoJogo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
        child: Column(
          children: [
            PlacarJogo(this._resultadoJogo),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        child: Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
          ],
        ),
      ),
    );
  }
}

class CadastroView extends StatelessWidget {
  final ResultadoJogo resultado;
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final pais1 = TextEditingController();
  final placar1 = TextEditingController();
  final pais2 = TextEditingController();
  final placar2 = TextEditingController();

  CadastroView(this.resultado);

  @override
  Widget build(BuildContext context) {
    pais1.text = resultado.adversario1;
    placar1.text = resultado.resultado1;
    pais2.text = resultado.adversario2;
    placar2.text = resultado.resultado2;

    return Scaffold(
        appBar: AppBar(
          title: Text("Resultado"),
        ),
        body: Container(
          padding: new EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: pais1,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "País",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: placar1,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Placar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: pais2,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "País",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: placar2,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Placar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              RaisedButton(
                child: Text(
                    resultado.id == null ? "Novo Placar" : "Atualiza Placar"),
                onPressed: () {
                  resultado.adversario1 = pais1.text;
                  resultado.adversario2 = pais2.text;
                  resultado.resultado1 = placar1.text;
                  resultado.resultado2 = placar2.text;

                  // _resultados.add(novoResultado);
                  if (resultado.id == null) {
                    PlacarRepository.save(resultado);
                  } else {
                    PlacarRepository.update(resultado);
                  }
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
            ],
          ),
        ));
  }
}