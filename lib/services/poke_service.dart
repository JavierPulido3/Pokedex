// lib/services/poke_service.dart
//
// FASE 2 — El Servicio
// ─────────────────────────────────────────────────────────────────────────────
// Este archivo encapsula todas las llamadas a la PokéAPI.
// Depende del modelo (Fase 1) pero NO tiene void main().
//
// Al terminar esta fase deberías poder hacer:
//
//   final servicio = PokeService();
//   final json = await servicio.obtenerPokemon('pikachu');
//
// ─────────────────────────────────────────────────────────────────────────────

import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeService {
  // URL base de la API — privada y constante
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  // ── obtenerPokemon ─────────────────────────────────────────────────────────
  // Recibe el nombre o ID del Pokémon como String.
  // Retorna el Map con los datos crudos de la API.
  // Lanza Exception si hay error.
  //
  // TODO: implementa el método
  Future<Map<String, dynamic>> obtenerPokemon(String idONombre) async {
    // PASO 1: construir la URL
    final url = Uri.parse('$_baseUrl/pokemon/$idONombre');

    // PASO 2: hacer el GET
    final response = await http.get(url);

    // PASO 3: verificar el status code y retornar o lanzar
    //
    //   status 200  → jsonDecode(response.body) as Map<String, dynamic>
    //   status 404  → throw Exception('Pokémon "$idONombre" no encontrado')
    //   otro status → throw Exception('Error del servidor: ${response.statusCode}')
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    if (response.statusCode == 404) {
      throw Exception('Pokémon "$idONombre" no encontrado');
    }

    throw Exception('Error del servidor: ${response.statusCode}');

    
  }
}
