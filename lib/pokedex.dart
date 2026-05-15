// lib/pokedex.dart
//
// FASE 3 — El Orquestador
// ─────────────────────────────────────────────────────────────────────────────
// Este archivo une el modelo y el servicio.
// La clase Pokedex es la que el main() usará directamente.
//
// Responsabilidades:
//   - Recibir un nombre/ID
//   - Llamar a PokeService para obtener el JSON
//   - Construir el objeto Pokemon con .fromJson()
//   - Llamar a pokemon.mostrar()
//   - Manejar TODOS los errores con try/on/catch/finally
//
// Al terminar esta fase el proyecto estará listo para el main.
// ─────────────────────────────────────────────────────────────────────────────

import 'models/pokemon.dart';
import 'services/poke_service.dart';

class Pokedex {
  final PokeService _servicio = PokeService();

  // ── buscar ─────────────────────────────────────────────────────────────────
  // Método principal. Recibe nombre o ID, muestra la ficha o un error claro.
  //
  // TODO: implementa con try / on Exception catch / catch / finally
  //
  // Comportamiento esperado:
  //
  //   Caso exitoso:
  //     Buscando a "pikachu"...
  //     ╔══════════════════════════════════════╗
  //     ║  #25 — PIKACHU ...
  //     ╚══════════════════════════════════════╝
  //     --- Búsqueda finalizada ---
  //
  //   Caso error (nombre incorrecto):
  //     Buscando a "pokemonXXX"...
  //     ❌ Pokémon "pokemonXXX" no encontrado
  //     --- Búsqueda finalizada ---
  //
  //   Caso error inesperado (sin internet, etc.):
  //     Buscando a "pikachu"...
  //     💥 Error inesperado: SocketException: ...
  //     --- Búsqueda finalizada ---

  Future<void> buscar(String idONombre) async {
    print('Buscando a "$idONombre"...\n');

    try {
      final json = await _servicio.obtenerPokemon(idONombre);
      final pokemon = Pokemon.fromJson(json);
      pokemon.mostrar();
    } on Exception catch (e) {
      // Captura solo objetos Exception (los que lanzamos en PokeService)
      print('❌ $e');
    } catch (e) {
      // Captura cualquier otro error (sin internet, timeout, etc.)
      print('💥 Error inesperado: $e');
    } finally {
      // SIEMPRE se ejecuta, haya error o no
      print('--- Búsqueda finalizada ---\n');
    }

    // TODO: implementa el bloque try/on/catch/finally aquí
    //
    // PISTA — estructura base:
    //
    //   try {
    //     final json    = await _servicio.obtenerPokemon(idONombre);
    //     final pokemon = Pokemon.fromJson(json);
    //     pokemon.mostrar();
    //
    //   } on Exception catch (e) {
    //     // Captura excepciones conocidas (404, servidor caído)
    //     print('❌ $e');
    //
    //   } catch (e) {
    //     // Captura cualquier otro error inesperado
    //     print('💥 Error inesperado: $e');
    //
    //   } finally {
    //     // SIEMPRE se ejecuta
    //     print('--- Búsqueda finalizada ---\n');
    //   }
  }
}
