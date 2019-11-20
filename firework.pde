public class firework {
  PVector ballPos[];
  PVector ballVit[];

  firework() {
    ballPos = new PVector[NUM_BALL];
    ballVit = new PVector[NUM_BALL];

    for (int i = 0; i < NUM_BALL; i++) {
      ballPos[i] = new PVector(0, 0);
      ballVit[i] = new PVector(0, 0);
    }
  }

  void setP(float offset) {
    if (mousePresent && (mouseX >= offMouseX && mouseX <= (width - offMouseX)) && (mouseY >= offMouseY && mouseY <= (height - offMouseY))) {
      posX = mouseX;
      posY = mouseY;
    } else {
      posX = random(offMouseX, width - offMouseX);
      posY = random(offMouseY, height - offMouseY);
    }

    for (int i = 0; i < NUM_BALL; i++) {
      float angle = (TWO_PI / float(NUM_BALL)) * i + offset;
      ballPos[i].set(posX, posY);
      ballVit[i].set(VIT * cos(angle), VIT * sin(angle));
    }
  }

  void move(float ajust) {
    for (int i = 0; i < NUM_BALL; i++) {
      fill((colH - (ballPos[i].y / 10.0)) % 255, 255, 255, (ballVit[i].mag() / VIT) * 255);
      circle(ballPos[i].x, ballPos[i].y, (scale * (ballVit[i].mag() / VIT)));

      ballPos[i].add(ballVit[i].x * ajust, ballVit[i].y * ajust);
      ballVit[i].x *= ACC;
      ballVit[i].y *= ACC;

      float angle = ballVit[i].heading();
      float magni = ballVit[i].mag();

      ballVit[i].x = magni * cos(angle + CURVE_TRAJ);
      ballVit[i].y = magni * sin(angle + CURVE_TRAJ);
    }
  }
}
