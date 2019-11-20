void newGame() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int x = 0; x < 3; x++) {
        for (int y = 0; y < 3; y++) {
          gridVal[i][j][x][y] = 0;
          gridAns[i][j][x][y] = 0;
          gridBool[i][j][x][y] = true;

          for (int a = 0; a < 9; a++) {
            gridGuess[i][j][x][y][a] = false;
          }
        }
      }
    }
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int l = 0; l < level; l++) {
        int x;
        int y;
        do {
          x = int(random(0, 3));
          y = int(random(0, 3));
        } while (!gridBool[i][j][x][y]);

        gridBool[i][j][x][y] = false;
      }
    }
  }

  boolean tryAgain;
  do {
    tryAgain = false;
    int turnTry = 0;

    boolean usedX[][][] = new boolean[3][3][9];
    boolean usedY[][][] = new boolean[3][3][9];
    boolean usedG[][][] = new boolean[3][3][9];
    for (int a = 0; a < 3; a++) {
      for (int b = 0; b < 3; b++) {
        for (int c = 0; c < 9; c++) {
          usedX[a][b][c] = false;
          usedY[a][b][c] = false;
          usedG[a][b][c] = false;
        }
      }
    }

    for (int i = 0; i < 3 && !tryAgain; i++) {
      for (int j = 0; j < 3 && !tryAgain; j++) {
        for (int y = 0; y < 3 && !tryAgain; y++) {
          for (int x = 0; x < 3 && !tryAgain; x++) {
            int choice = int(random(1, 9.5));
            while (usedX[i][x][choice - 1] || usedY[j][y][choice - 1] || usedG[i][j][choice - 1]) {
              choice = int(random(1, 9.5));
              turnTry++;

              if (turnTry > 810) {
                tryAgain = true;
                break;
              }
            }

            usedX[i][x][choice - 1] = true;
            usedY[j][y][choice - 1] = true;
            usedG[i][j][choice - 1] = true;

            gridVal[i][j][x][y] = choice;
          }
        }
      }
    }
  } while (tryAgain);

  if (level == 0) {
    levelWon = int(9);
  } else {
    levelWon = int(level);
  }
  festivity.clear();
  for (int i = 0; i < levelWon; i++) {
    festivity.add(new firework());
    festivity.get(i).setP((TWO_PI / float(NUM_BALL)) * (float(i) / float(levelWon)));
  }

  selectX = -1;
  selectY = -1;
  finished = false;
  firstTime = false;
  pause = false;
  clock = millis();
  timeFire = millis();
}
