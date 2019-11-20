float scale = 9;
int level = 0;
int mX = -1, mY = -1;
int selectX = -1, selectY = -1;
boolean mousePresent = false;
boolean mouseValid = false;

int gridVal[][][][] = new int[3][3][3][3];
int gridAns[][][][] = new int[3][3][3][3];
boolean gridGuess[][][][][] = new boolean[3][3][3][3][9];
boolean gridBool[][][][] = new boolean[3][3][3][3];

boolean cheat = false;
boolean guessing = false;
boolean finished;

final int NUM_BALL = 16;
final float ACC = 0.98;
final float VIT = 5.0;
final float CURVE_TRAJ = HALF_PI / 90.0;
int timeFire = millis();
int timeFin = millis();
int last = millis();
float frameAjust = 60.0;

int levelWon;
int fireAt = 0;
ArrayList<firework> festivity = new ArrayList<firework>();

final float SEP = 175;
float posX = 0;
float posY = 0;

final int TIME_ERROR = 1000;
int error = millis();

int offMouseX = 0;
int offMouseY = 0;

final color MENU_TEXT_COL = color(235, 235, 235, 200);
final color MENU_BACK_COL = color(50, 50, 50, 175);
final float ARROW_ANGLE = HALF_PI / 4.0;

int clock = millis();
int timePause = 0;
String hourS = "00";
String minS = "00";
String secS = "00";

boolean firstTime = true;

float colH = 255;

boolean pause = false;

void setup() {
  fullScreen();
  frameAjust = frameRate;

  if (width <= height) {
    scale = width / scale;
    offMouseY = int(abs(float(height - width) / 2.0) + 0.5);
  } else {
    scale = height / scale;
    offMouseX = int(abs(float(width - height) / 2.0) + 0.5);
  }

  newGame();
  finished = true;
  firstTime = true;
  level = 3;
}

void draw() {
  if (pause) {
    background(0);
  } else {
    background(0, 5, 137);
  }
  rectMode(CORNER);
  finishAction();
  setmXmY();

  if (!pause) {
    gridDrawing();
  } else {
    fill(0);
    noStroke();
    rect(offMouseX, offMouseY, width - (offMouseX * 2), height - (offMouseY * 2));

    fill(205);
    textSize(scale * 2.0);
    textAlign(CENTER, CENTER);
    text("PAUSE", width / 2, height / 2);
  }

  finishDraw();

  error();

  menuLevel();
  if (!finished) {
    finished = winning();
    if (finished) {
      timeFin = millis();
    }
  } else {
    pause = false;
  }

  time();

  colH++;
  colH %= 255;
}

void error() {
  push();
  translate(offMouseX, offMouseY);
  if (millis() - error < TIME_ERROR && millis() > TIME_ERROR) {
    fill(255, 0, 0, (1.0 - (abs(float(millis() - error) - (float(TIME_ERROR) / 2.0)) / (float(TIME_ERROR) / 2.0))) * 255.0);
    textSize(scale);

    textAlign(LEFT, CENTER);
    text('!', selectX * scale, (selectY + 0.4) * scale);

    textAlign(RIGHT, CENTER);
    text('!', (selectX + 1) * scale, (selectY + 0.4) * scale);
  }
  pop();
}
