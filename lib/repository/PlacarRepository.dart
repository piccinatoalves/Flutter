import 'package:base/components/Resultadojogo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PlacarRepository {
  static final PlacarRepository _singleton = new PlacarRepository();

  factory PlacarRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "jogos.db");
    var bd = await openDatabase(localDatabase, version: versiondb,
        onCreate: (db, versiondb) {
      String sql =
          "create table jogos(id integer primary key, pais1 varchar, pais2 varchar, resultado1 varchar, resultado2 varchar)";
      db.execute(sql);
    });
    return bd;
  }
    static save(ResultadoJogo resultado) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "pais1": resultado.pais1,
      "pais2": resultado.pais2,
      "resultado1": resultado.resultado1,
      "resultado2": resultado.resultado2
    };

    int id = await bd.insert("jogos", dadosResultado);
    print("salvou $id");
  }
    static Future list() async {
    Database bd = await _dataBaseManager();
    List listaTesultados = await bd.rawQuery("select * from jogos");

    var _jogos = new List();
    for (var item in listaTesultados) {
      _jogos.add(new ResultadoJogo(item['pais1'], item['pais2'],
          item['resultado1'], item['resultado2']));
    }

    return _jogos;
  }
  static update(ResultadoJogo resultado) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "pais1": resultado.pais1,
      "pais2": resultado.pais2,
      "resultado1": resultado.resultado1,
      "resultado2": resultado.resultado2
    };

    bd.update("jogos", dadosResultado,
        where: "id = ?", whereArgs: [resultado.id]);
  }
}
