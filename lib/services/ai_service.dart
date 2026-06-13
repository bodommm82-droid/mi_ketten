class AiService {
  Future<String> getNextSuggestion(Map<String, int> categoryScores) async {
    // Megkeressük, melyik kategóriában a legerősebbek (pl. "Romantikus" vs "Humor")
    var bestCategory =
        categoryScores.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    // Logika az ajánláshoz
    if (bestCategory == 'Romantikus') {
      return "Úgy tűnik, nagyon egy hullámhosszon vagytok! Próbáljátok ki a 'Mély beszélgetések' módot.";
    } else {
      return "Sokat nevettetek a játék alatt! A 'Humor-bomba' mód tökéletes lesz számotokra.";
    }
  }
}
