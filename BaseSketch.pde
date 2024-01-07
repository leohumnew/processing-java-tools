// VARIABLES //
int stage = -1;
PImage loading;

// MAIN FUNCTIONS //
void settings() {
  fullScreen(P2D);
}

void setup(){
  surface.setTitle("");
  // ((PGraphicsOpenGL)g).textureSampling(2);
  frameRate(60);

  // Load screen while loading assets
  loading = loadImage(dataPath("loading.png"));
  thread("loadAssets");
}

void draw(){
  background(0);
  if (stage == -2) drawSettings(); // Settings
  else if (stage == -1) image(loading, 0, 0); // Loading screen
  else if (stage == 0) drawMenu(); // Main menu
}

// DRAW FUNCTIONS //
void drawSettings(){
  // TODO
}

void drawMenu(){
  // TODO
}

// LOAD ASSETS //
void loadAssets(){
  // TODO Utilities.loadImagePng();
  stage = 0;
}