static class TextManager {
  private static final String[] LANGUAGES = {"en", "es"};
  private static HashMap<String, String[]> text = new HashMap<String, String[]>();

  public static void setLanguage(String language) {
    // If valid language, load the relevant JSONObject file, then loop through the contained arrays and add them to the HashMap
    if(Utilities.contains(LANGUAGES, language)) {
      JSONArray json = loadJSONObject(language + "_Text.json");
      String[] keys = json.names();
      for(int i = 0; i < json.size(); i++) {
        text.put(keys[i], json.getJSONArray(keys[i]).getStringArray());
      }
    }
  }
}
