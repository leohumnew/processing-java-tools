// Class for managing UI elements
class UIManager {
  private ArrayList<UIElement> UIElements = new ArrayList<UIElement>();

  public void addUIElement(UIElement element) {
      UIElements.add(element);
  }

  public void clearUIElements() {
    UIElements.clear();
  }

  public void render() {
    textAlign(CENTER, CENTER);
    textSize(18);

    for (UIElement element : UIElements) {
      element.render();
    }
  }
}

// Interface for UI elements
interface UIElement {
  public void render();
}

// UI ELEMENT IMPLEMENTATIONS //
class TextButton implements UIElement {
  private String text;
  private color buttonColor;
  private int x, y, width, height;

  public TextButton(UIManager uiManager, int x, int y, int width, int height, color buttonColor, String text) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.buttonColor = buttonColor;
    this.text = text;

    uiManager.addUIElement(this);
  }

  public void render() {
    if(mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height) {
      fill(buttonColor, 150);
    } else {
      fill(buttonColor);
    }
    rect(x, y, width, height, 5);
    fill(0);
    text(text, x + width / 2, y + height / 2);
  }
}

class ImgButton implements UIElement {
  private PImage image;
  private int x, y, width, height;

  public ImgButton(UIManager uiManager, int x, int y, int width, int height, PImage image) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.image = image;

    uiManager.addUIElement(this);
  }

  public void render() {
    image(image, x, y, width, height);
  }
}

class Text implements UIElement {
  private String text;
  private int x, y;

  public Text(UIManager uiManager, int x, int y, String text) {
    this.x = x;
    this.y = y;
    this.text = text;

    uiManager.addUIElement(this);
  }

  public void render() {
    fill(0);
    text(text, x, y);
  }
}

class FPSCounter implements UIElement {
  private int x, y;

  public FPSCounter(UIManager uiManager, int x, int y) {
    this.x = x;
    this.y = y;

    uiManager.addUIElement(this);
  }

  public void render() {
    fill(255);
    // FPS, rounded to 0 decimal places
    text("FPS: " + Math.round(frameRate), x, y);
  }
}