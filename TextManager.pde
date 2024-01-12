static class TextManager {
  private static final String[] LANGUAGES = {"en", "es"};
  private static HashMap<String, String[]> text = new HashMap<String, String[]>();

  // Set the language to use and load the relevant text file
  public static void setLanguage(PApplet sketch, String language) {
    // If valid language, load the relevant JSONObject file, then loop through the contained arrays and add them to the HashMap
    if(Utilities.contains(LANGUAGES, language)) {
      JSONObject json = sketch.loadJSONObject(language + "_Text.json");
      java.util.Set<String> keys = json.keys();
      for(String key : keys) {
        text.put(key, json.getJSONArray(key).toStringArray());
      }
    }
  }

  // Get the text for a given key and index
  public static String get(String key, int index) {
    return text.get(key)[index];
  }
}