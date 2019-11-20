void menuLevel() {
  if (offMouseX > 0) {
    noStroke();
    textSize(offMouseX);
    textAlign(CENTER, CENTER);
    fill(MENU_TEXT_COL);
    text(level, width - (offMouseX / 2.0), height / 2.4);
    textSize(offMouseX / 5.0);
    text("NIVEAU", width - (offMouseX / 2.0), height / 16.0);

    stroke(205);
    fill(MENU_BACK_COL);
    strokeWeight(offMouseX / 25.0);
    rectMode(CENTER);

    boolean boolX = (mouseX >= width - (offMouseX / 1.2) && mouseX <= width - (offMouseX / 6.0)) && mousePresent;

    {
      push();
      float prop = 1;
      if (boolX && (mouseY <= (height / 2.0) - ((offMouseX / 3.0) * 2.2) + (offMouseX / 6.0) && mouseY >= (height / 2.0) - ((offMouseX / 3.0) * 2.2) - (offMouseX / 6.0))) {
        if (mousePressed) {
          fill(55);
          prop = 1.05;
        } else {
          fill(255);
          stroke(155);
          prop = 1.025;
        }
      }

      translate(width - (offMouseX / 2.0), (height / 2.0) - ((offMouseX / 3.0) * 2.2));
      rect(0, 0, (offMouseX / 3.0) * 2.0 * prop, (offMouseX / 3.0) * prop, 50.0);
      line(0, -(offMouseX / 3.5) * sin(ARROW_ANGLE) * prop, (offMouseX / 3.5) * cos(ARROW_ANGLE) * prop, (offMouseX / 3.5) * sin(ARROW_ANGLE) * prop);
      line(0, -(offMouseX / 3.5) * sin(ARROW_ANGLE) * prop, (offMouseX / 3.5) * -cos(ARROW_ANGLE) * prop, (offMouseX / 3.5) * sin(ARROW_ANGLE) * prop);
      pop();
    }

    {
      push();
      float prop = 1;
      if (boolX && (mouseY >= (height / 2.0) + ((offMouseX / 3.0) * 1.6) - (offMouseX / 6.0) && mouseY <= (height / 2.0) + ((offMouseX / 3.0) * 1.6) + (offMouseX / 6.0))) {
        if (mousePressed) {
          fill(55);
          prop = 1.05;
        } else {
          fill(255);
          stroke(155);
          prop = 1.025;
        }
      }

      translate(width - (offMouseX / 2.0), (height / 2.0) + ((offMouseX / 3.0) * 1.6));
      rect(0, 0, (offMouseX / 3.0) * 2.0 * prop, (offMouseX / 3.0) * prop, 50.0);
      line(0, (offMouseX / 3.5) * sin(ARROW_ANGLE) * prop, (offMouseX / 3.5) * cos(ARROW_ANGLE) * prop, (offMouseX / 3.5) * -sin(ARROW_ANGLE) * prop);
      line(0, (offMouseX / 3.5) * sin(ARROW_ANGLE) * prop, (offMouseX / 3.5) * -cos(ARROW_ANGLE) * prop, (offMouseX / 3.5) * -sin(ARROW_ANGLE) * prop);
      pop();
    }

    {
      push();
      float prop = 1;
      if (mousePresent && (mouseX >= width - (offMouseX / 2.0) - (offMouseX * 0.45) && mouseX <= width - (offMouseX / 2.0) + (offMouseX * 0.45)) && (mouseY >= (height / 13.0) * 11.65 - (height / 11) && mouseY <= (height / 13.0) * 11.65 + (height / 11))) {
        if (mousePressed) {
          fill(55);
          prop = 1.05;
        } else {
          fill(255);
          stroke(155);
          prop = 1.025;
        }
      }

      translate(width - (offMouseX / 2.0), (height / 13.0) * 11.65);
      rect(0, 0, (offMouseX * 0.9) * prop, (height / 5.5) * prop, 50.0);
      textAlign(CENTER, CENTER);        
      if (prop == 1.025) {
        fill(155);
      } else {
        fill(205);
      }
      textSize((offMouseX / 6.0) * prop);
      text("NOUVELLE", 0, scale * -0.4);
      textSize((offMouseX / 4.0) * prop);
      text("PARTIE", 0, scale * 0.2);
      pop();
    }
  }
}
