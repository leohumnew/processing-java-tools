static class SaveManager {
  public static enum Setting {FULLSCREEN, LANGUAGE};
  private static final String SAVE_FILE = "save.dat";
  private static byte[] save;

  private static byte[] createSave() {
    return new byte[] {
      0x01, // Fullscreen: 0 = false, 1 = true
      0x00 // Language: 0 = English, 1 = Spanish
    };
  }

  public static void loadSave(PApplet sketch) {
    if (sketch.dataFile(SAVE_FILE).isFile()) save = sketch.loadBytes(SAVE_FILE);
    else save = createSave();
  }

  public static void saveSave(PApplet sketch, byte[] save) {
    sketch.saveBytes(SAVE_FILE, save);
  }

  public static int getSetting(int setting) {
    return save[setting];
  }
}