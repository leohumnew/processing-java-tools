import java.util.function.Function;

// Class for managing UI elements
class UIManager {
  private ArrayList<UIElement> UIElements = new ArrayList<UIElement>();

  public void add(UIElement element) {
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

  TextButton(int x, int y, int width, int height, color buttonColor, String text) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.buttonColor = buttonColor;
    this.text = text;
  }

  public void render() {
    if(mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height) {
      if(mousePressed) {
        fill(buttonColor, 150);
      } else {
        fill(buttonColor, 200);
      }
    } else {
      fill(buttonColor);
    }
    rect(x, y, width, height, 5);
    fill(0);
    text(text, x + width / 2, y + height / 2);
  }
}

class ImgButton implements UIElement {
  private PImage image, imageHover, imagePressed;
  private int x, y, width, height;

  ImgButton(int x, int y, int width, int height, PImage image, PImage imageHover, PImage imagePressed) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.image = image;
    this.imageHover = imageHover;
    this.imagePressed = imagePressed;
  }

  public void render() {
    if(mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height) {
      if(mousePressed) {
        image(imagePressed, x, y, width, height);
      } else {
        image(imageHover, x, y, width, height);
      }
    } else {
      image(image, x, y, width, height);
    }
  }
}

class Text implements UIElement {
  private String text;
  private int x, y;

  Text(int x, int y, String text) {
    this.x = x;
    this.y = y;
    this.text = text;
  }

  public void render() {
    fill(0);
    text(text, x, y);
  }
}

class FPSCounter implements UIElement {
  private int x, y;

  FPSCounter(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public void render() {
    fill(255);
    // FPS, rounded to 0 decimal places
    text("FPS: " + Math.round(frameRate), x, y);
  }
}

// FADE MANAGER //
class FadeManager {
  private int duration;
  private int initTime;
  private int fadeState = -1; // -1: Inactive, 0: Fading in, 1: Fading out
  private int newValue;
  private Function<Integer, Void> callback;

  FadeManager(int duration) {
    this.duration = duration / 2;
  }

  public void fade(Function<Integer, Void> callback, int newValue) {
    this.callback = callback;
    this.newValue = newValue;
    fadeState = 0;
    initTime = millis();
  }

  public void update() {
    if (fadeState == -1) return;
    else if (fadeState == 0) {
      fill(0, constrain(map(millis(), initTime, initTime + duration, 0, 255), 0, 255));
      if (millis() >= initTime + duration) {
        if(callback != null) callback.apply(newValue);
        fadeState = 1;
        initTime = millis();
      }
    } else if (fadeState == 1) {
      fill(0, constrain(map(millis(), initTime, initTime + duration, 255, 0), 0, 255));
      if (millis() >= initTime + duration) {
        fadeState = -1;
      }
    }

    rect(0, 0, width, height);
  }
}