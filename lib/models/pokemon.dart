// lib/models/pokemon.dart
//
// FASE 1 — El Modelo
// ─────────────────────────────────────────────────────────────────────────────
// Este archivo define las clases que representan los datos de un Pokémon.
// No hace llamadas a la API — solo estructura y mapea datos.
//
// Al terminar esta fase deberías poder crear un Pokemon así:
//
//   final p = Pokemon.fromJson(jsonMap);
//   p.mostrar();
//
// ─────────────────────────────────────────────────────────────────────────────

// ── Clase auxiliar ────────────────────────────────────────────────────────────
// Representa un stat individual (hp, attack, defense, etc.)
class PokemonStat {
  final String nombre;
  final int valor;

  PokemonStat(this.nombre, this.valor);
}

// ── Clase principal ───────────────────────────────────────────────────────────
class Pokemon {
  // TODO: declara los atributos privados
  late int _id;
  late String _name;
  late int _height;
  late int _weight;
  late int _baseExperience;
  late List<String> _types;
  late List<PokemonStat> _stats;
  late List<String> _abilities;

  // La API retorna estos campos:
  //   json['id']              → int
  //   json['name']            → String
  //   json['height']          → int  (en decímetros  → dividir entre 10 para metros)
  //   json['weight']          → int  (en hectogramos → dividir entre 10 para kg)
  //   json['base_experience'] → int
  //   json['types']           → List, cada item: item['type']['name']
  //   json['stats']           → List, cada item: { nombre: item['stat']['name'], valor: item['base_stat'] }
  //   json['abilities']       → List, cada item: item['ability']['name']

  // late int _id;
  // late String _name;
  // ...

  // ── Constructor nombrado ───────────────────────────────────────────────────
  // TODO: implementa el constructor que extrae los datos del Map
  Pokemon.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _height = json['height'];
    _weight = json['weight'];
    _baseExperience = json['base_experience'];

    _types = (json['types'] as List)
        .map((t) => t['type']['name'] as String)
        .toList();

    _stats = (json['stats'] as List)
        .map((s) => PokemonStat(
              s['stat']['name'] as String,
              s['base_stat'] as int,
            ))
        .toList();

    _abilities = (json['abilities'] as List)
        .map((a) => a['ability']['name'] as String)
        .toList();

    // _id   = json['id'];
    // _name = json['name'];
    // ...
    //
    // PISTA para mapear la lista de tipos:
    //   _types = (json['types'] as List)
    //       .map((t) => t['type']['name'] as String)
    //       .toList();
    //
    // PISTA para mapear los stats:
    //   _stats = (json['stats'] as List)
    //       .map((s) => PokemonStat(
    //             s['stat']['name'] as String,
    //             s['base_stat']    as int,
    //           ))
    //       .toList();
  }

  // ── Getters ───────────────────────────────────────────────────────────────
  // TODO: expón cada atributo con un getter (sin setters — un Pokémon no cambia)
  int get id => _id;
  String get name => _name;
  double get height => _height / 10;
  double get weight => _weight / 10;
  int get baseExperience => _baseExperience;
  List<String> get types => _types;
  List<PokemonStat> get stats => _stats;
  List<String> get abilities => _abilities;

  // int    get id             => _id;
  // String get name           => _name;
  // ...

  // ── Método mostrar() ──────────────────────────────────────────────────────
  // TODO: imprime la ficha completa del Pokémon
  //
  // Salida esperada:
  //
  //   ╔══════════════════════════════════════╗
  //   ║  #25 — PIKACHU
  //   ║  Altura: 0.4m   Peso: 6.0kg   XP base: 112
  //   ║
  //   ║  Tipos:       electric
  //   ║  Habilidades: static, lightning-rod
  //   ║
  //   ║  Stats:
  //   ║    hp        35  ████████░░░░░░░░
  //   ║    attack    55  █████████████░░░
  //   ║    defense   40  ██████████░░░░░░
  //   ║    speed     50  ████████████░░░░
  //   ╚══════════════════════════════════════╝
  void mostrar() {
    print('╔══════════════════════════════════════╗');
    print('║  #$_id — ${_name.toUpperCase()}');
    print(
        '║  Altura: ${height}m  Peso: ${weight}kg  XP base: $_baseExperience');
    print('║');
    print('║  Tipos:       ${_types.join(', ')}');
    print('║  Habilidades: ${_abilities.join(', ')}');
    print('║');
    print('║  Stats:');

    for (final stat in _stats) {
      final nombre = stat.nombre.padRight(10);
      final valor = stat.valor.toString().padLeft(3);
      print('║    $nombre $valor  ${_barra(stat.valor)}');
    }
    print('╚══════════════════════════════════════╝');

    // PISTA: usa _barra() para generar la barra de cada stat
  }

  // ── Helper privado ────────────────────────────────────────────────────────
  // Genera una barra de progreso tipo: ████████░░░░░░░░
  String _barra(int valor, {int max = 150, int ancho = 16}) {
    final llenos = (valor / max * ancho).round().clamp(0, ancho);
    return '█' * llenos + '░' * (ancho - llenos);
  }
}
