boolean winning() {
  boolean working = true;

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

  for (int i = 0; i < 3 && working; i++) {
    for (int j = 0; j < 3 && working; j++) {
      for (int x = 0; x < 3 && working; x++) {
        for (int y = 0; y < 3 && working; y++) {
          if (gridBool[i][j][x][y]) {
            if (!usedX[i][x][gridVal[i][j][x][y] - 1] && !usedY[j][y][gridVal[i][j][x][y] - 1] && !usedG[i][j][gridVal[i][j][x][y] - 1]) {
              usedX[i][x][gridVal[i][j][x][y] - 1] = true;
              usedY[j][y][gridVal[i][j][x][y] - 1] = true;
              usedG[i][j][gridVal[i][j][x][y] - 1] = true;
            } else {
              working = false;
              break;
            }
          } else {
            if (gridAns[i][j][x][y] != 0) {
              if (!usedX[i][x][gridAns[i][j][x][y] - 1] && !usedY[j][y][gridAns[i][j][x][y] - 1] && !usedG[i][j][gridAns[i][j][x][y] - 1]) {
                usedX[i][x][gridAns[i][j][x][y] - 1] = true;
                usedY[j][y][gridAns[i][j][x][y] - 1] = true;
                usedG[i][j][gridAns[i][j][x][y] - 1] = true;
              } else {
                working = false;
                break;
              }
            } else {
              working = false;
              break;
            }
          }
        }
      }
    }
  }

  return working;
}
