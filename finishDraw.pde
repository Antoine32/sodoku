void finishAction() {
  if (finished) {
    if (int((millis() - timeFire) / SEP) >= fireAt && fireAt < levelWon) {
      festivity.get(int((millis() - timeFire) / SEP)).setP((TWO_PI / float(NUM_BALL)) * (float(fireAt) / float(levelWon)));
      fireAt++;
    } else if (fireAt >= levelWon && festivity.get(levelWon - 1).ballVit[0].mag() < VIT * 0.1) {
      timeFire = millis();
      fireAt = 0;
    }

    selectX = -1;
    selectY = -1;
  }
}

void finishDraw() {
  if (finished) {
    float diff = ((width - (offMouseX * 2.0)) + (height - (offMouseY * 2.0))) * 0.009;
    float prop;
    color useThisCol;
    if ((mouseX >= offMouseX && mouseX <= (width - offMouseX) && (mouseY >= offMouseY && mouseY <= (height - offMouseY)))) {
      if (mousePressed) {
        fill(55, 55, 55);
        stroke(155);
        useThisCol = color(155);
        prop = 1.03;
      } else {
        fill(235, 235, 235, 200);
        stroke(155);
        useThisCol = color(155);
        prop = 1.005;
      }
    } else {
      fill(MENU_BACK_COL);
      stroke(MENU_TEXT_COL);
      useThisCol = color(MENU_TEXT_COL);
      prop = 1;
    }
    rectMode(CENTER);
    {
      push();
      noStroke();
      rect(width / 2.0, height / 2.0, (width - (offMouseX * 2.0)) * prop, (height - (offMouseY * 2.0)) * prop);
      pop();
    }
    {
      push();
      noFill();
      rect(width / 2.0, height / 2.0, ((width - (offMouseX * 2.0)) - diff) * prop, ((height - (offMouseY * 2.0)) - diff) * prop);
      pop();
    }
    rectMode(CORNER);

    float ajust = float(millis() - last) / (1000.0 / frameAjust);
    last = millis();

    noStroke();
    colorMode(HSB);
    for (int i = 0; i < levelWon; i++) {
      festivity.get(i).move(ajust);
    }
    colorMode(RGB);

    fill(useThisCol);
    noStroke();
    textSize(scale * 2 * prop);
    textAlign(CENTER, CENTER);
    push();
    translate(width / 2, (height / 2.1));

    if (firstTime) {
      colorMode(HSB);
      fill(colH, 255, 255);
      text("SUDOKU", 0, -((height - (offMouseY * 2.0)) / 3.5) * prop); 
      textSize(scale * 1.2 * prop);
      fill((colH - 10) % 255, 255, 255);
      text("PAR", 0, -((height - (offMouseY * 2.0)) / 9.5) * prop);
      textAlign(LEFT, CENTER);
      fill((colH - 20) % 255, 255, 255);
      text("ANTOINE", -(((width - (offMouseX * 2.0)) / 2.0) - (scale / 5.0)) * prop, ((height - (offMouseY * 2.0)) / 100.0) * prop);
      textAlign(RIGHT, CENTER);
      fill((colH - 30) % 255, 255, 255);
      text("CALTAGIRONE", (((width - (offMouseX * 2.0)) / 2.0) - (scale / 5.0)) * prop, ((height - (offMouseY * 2.0)) / 8.0) * prop);
      colorMode(RGB);
    } else {
      text("TU AS", 0, -((height - (offMouseY * 2.0)) / 10.0) * prop); 
      text("GAGNÉ", 0, ((height - (offMouseY * 2.0)) / 10.0) * prop);

      if (millis() - timeFin < 10100) {
        textSize((scale / 5.0) * prop);
        text(10 - int((millis() - timeFin) / 1000), 0, ((height - (offMouseY * 2.0)) / 4.0) * prop);
        if (millis() - timeFin > 10000) {
          firstTime = true;
        }
      }
    }
    push();
    fill(useThisCol);
    textSize((scale / 3.0) * prop);
    textAlign(CENTER, CENTER);
    translate(0, ((height - (offMouseY * 2.0)) / 8.0) * 3.0);
    text("CLIQUE N'IMPORTE OÙ SUR LE JEU", 0, -((height - (offMouseY * 2.0)) / 40.0) * prop);
    text("POUR COMMENCER UNE NOUVELLE PARTIE", 0, ((height - (offMouseY * 2.0)) / 40.0) * prop);
    pop();
    pop();
  }
}
