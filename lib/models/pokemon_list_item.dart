class PokemonListItem {
  PokemonListItem({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  String get imageUrl {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${url.split("/").last}";
  }
}
