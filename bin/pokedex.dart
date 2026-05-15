// bin/pokedex.dart
//
// FASE 4 — El punto de entrada
// ─────────────────────────────────────────────────────────────────────────────
// Este es el ÚNICO void main() del proyecto.
// Corre con:  dart run bin/pokedex.dart
//
// En esta fase el código de lib/ ya debe estar completo.
// Tu trabajo aquí es armar la sesión de búsquedas.
// ─────────────────────────────────────────────────────────────────────────────

import 'package:taller_pokedex/pokedex.dart';

void main() async {
  final dex = Pokedex();

  // ── TODO: arma tu sesión de búsquedas ─────────────────────────────────────
  //
  // PASO 1: busca un Pokémon que existe
  await dex.buscar('pikachu');
  //
  // PASO 2: busca otro
  await dex.buscar('mewtwo');
  //
  // PASO 3: busca uno que NO existe (debe mostrar error amigable)
  await dex.buscar('pokemonXXX');
  //
  // PASO 4: busca usando ID numérico en lugar de nombre
  await dex.buscar('94'); // gengar
  //
  // PASO 5 (reto): arma tu propio equipo de 3 favoritos

  // ── Salida esperada final ─────────────────────────────────────────────────
  //
  //   Buscando a "pikachu"...
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
  //   --- Búsqueda finalizada ---
  //
  //   Buscando a "pokemonXXX"...
  //   ❌ Pokémon "pokemonXXX" no encontrado
  //   --- Búsqueda finalizada ---
}
