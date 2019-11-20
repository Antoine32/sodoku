void gridDrawing() {
  push();
  translate(offMouseX, offMouseY);

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int x = 0; x < 3; x++) {
        for (int y = 0; y < 3; y++) {
          boolean selected = (selectX == ((i * 3) + x) && selectY == ((j * 3) + y));

          if (((i * 3) + x) == mX && ((j * 3) + y) == mY) {
            if (mouseValid) {
              if (mousePressed) {
                if (selected) {
                  fill(0, 52, 160);
                } else if (((i * 3) + x) == selectX || ((j * 3) + y) == selectY) {
                  fill(50, 102, 160);
                } else {
                  fill(182, 250, 230);
                }
              } else {
                if (selected) {
                  fill(2, 79, 240);
                } else if (((i * 3) + x) == selectX || ((j * 3) + y) == selectY) {
                  fill(72, 149, 240);
                } else {
                  fill(255);
                }
              }
            } else {
              if (((i * 3) + x) == selectX || ((j * 3) + y) == selectY) {
                fill(100, 152, 160);
              } else {
                fill(255, 255, 222);
              }
            }
          } else if ((((i * 3) + x) == mX || ((j * 3) + y) == mY) && mouseValid) {
            if (selected) {
              fill(40, 95, 255);
            } else if (((i * 3) + x) == selectX || ((j * 3) + y) == selectY) {
              fill(130, 185, 255);
            } else {
              fill(255, 255, 222);
            }
          } else if (selected) {
            fill(53, 104, 211);
          } else if (((i * 3) + x) == selectX || ((j * 3) + y) == selectY) {
            fill(153, 204, 211);
          } else {
            fill(244, 250, 182);
          }
          stroke(0);
          strokeWeight(1);
          rect(scale * ((i * 3) + x), scale * ((j * 3) + y), scale, scale);

          noStroke();
          textSize(scale);
          textAlign(CENTER, CENTER);
          if (gridBool[i][j][x][y]) {
            if (firstTime) {
              colorMode(HSB);
              fill((colH - ((j * 3) + y) * 10) % 255, 255, 255);
              colorMode(RGB);
            } else {
              fill(0);
            }
            text(gridVal[i][j][x][y], scale * ((i * 3) + x + 0.5), scale * ((j * 3) + y + 0.4));
          } else {
            if (gridAns[i][j][x][y] != 0) {
              fill(252, 114, 0);
              text(gridAns[i][j][x][y], scale * ((i * 3) + x + 0.5), scale * ((j * 3) + y + 0.4));
            } else if (cheat) {
              fill(255, 150, 150);
              text(gridVal[i][j][x][y], scale * ((i * 3) + x + 0.5), scale * ((j * 3) + y + 0.4));
            }

            if (((i * 3) + x) == selectX && ((j * 3) + y) == selectY) {
              fill(200);
            } else if (((i * 3) + x) == selectX || ((j * 3) + y) == selectY) {
              fill(50);
            } else {
              fill(100);
            }
            textAlign(RIGHT, TOP);
            guess(gridGuess[i][j][x][y], scale * ((i * 3) + x + 1), scale * ((j * 3) + y - 0.04), scale / 3.0);
          }
        }
      }
    }
  }

  stroke(0);
  strokeWeight(3);
  line(scale * 3.0, 0, scale * 3.0, scale * 9.0);
  line(scale * 6.0, 0, scale * 6.0, scale * 9.0);
  line(0, scale * 3.0, scale * 9.0, scale * 3.0);
  line(0, scale * 6.0, scale * 9.0, scale * 6.0);

  pop();
}

String guess(boolean[] b, float x, float y, float textSiz) {
  String text = "";
  int n = 0;
  int c = 0;

  for (int i = 0; i <= 8; i++) {
    if (b[i]) {
      c++;
    }
  }

  if (c <= 1) {
  } else if (c <= 3) {
    textSiz /= ((float(c) / 2.0) + 0.5);
  } else {
    textSiz /= ((float(3) / 2.0) + 0.5);
  }

  textSize(textSiz);

  for (int i = 0; i <= 8; i++) {
    if (b[i]) {
      if ((text.length() + 1) % 6 == 0) {
        text(text, x, y + (n * textSiz) + constrain((float(c) / 3.0), 0, 1));
        text = "";
        n++;
      } else if (text.length() > 0) {
        text += ' ';
      }
      text += (i + 1);
    }
  }

  text(text, x, y + (n * textSiz) + constrain((float(c) / 3.0), 0, 1));

  return text;
}
