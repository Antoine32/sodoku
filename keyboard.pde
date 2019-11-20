void keyReleased() {
  if ((selectX >= 0 && selectY >= 0 || finished) && keyCode >= 48 && keyCode <= 57 && !pause) {
    int ans = 0;

    switch (keyCode) {
    case 49 :
      ans = 1;
      break;
    case 50 :
      ans = 2;
      break;
    case 51 :
      ans = 3;
      break;
    case 52 :
      ans = 4;
      break;
    case 53 :
      ans = 5;
      break;
    case 54 :
      ans = 6;
      break;
    case 55 :
      ans = 7;
      break;
    case 56 :
      ans = 8;
      break;
    case 57 :
      ans = 9;
      break;
    }

    if (finished) {
      if (ans == 0) {
        newGame();
      } else {
        level = ans;
      }
    } else if (guessing) {
      if (gridAns[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)] == 0) {
        if (ans == 0) {
          for (int a = 0; a < 9; a++) {
            gridGuess[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)][a] = false;
          }
        } else {
          gridGuess[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)][ans - 1] = !gridGuess[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)][ans - 1];
        }
      } else {
        error = millis();
      }
    } else {
      if (ans > 0) {
        for (int a = 0; a < 9; a++) {
          gridGuess[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)][a] = false;
        }
      }
      if (gridAns[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)] == ans || ans == 0) {
        gridAns[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)] = 0;
      } else {
        gridAns[int(selectX / 3)][int(selectY / 3)][int(selectX % 3)][int(selectY % 3)] = ans;
        for (int i = 0; i < 9; i++) {
          gridGuess[int(i / 3)][int(selectY / 3)][int(i % 3)][int(selectY % 3)][ans - 1] = false;
          gridGuess[int(selectX / 3)][int(i / 3)][int(selectX % 3)][int(i % 3)][ans - 1] = false;
          gridGuess[int(selectX / 3)][int(selectY / 3)][int(i % 3)][int(i / 3)][ans - 1] = false;
        }
      }
    }
  }

  switch (keyCode) { 
  case 67 : // c
    cheat = !cheat; 
    break; 
  case 70 : // f
    firstTime = !firstTime;
    break;
  case 61 : // +
    guessing = false; 
    break; 
  case 45 : // -
    guessing = true; 
    break; 
  case 32 : 
    if (!finished) {
      pause = !pause;
      if (pause) {
        timePause = millis() - clock;
      }
    }
    break;
  case UP : 
    level = constrain(level + 1, 1, 9); 
    break; 
  case DOWN : 
    level = constrain(level - 1, 1, 9); 
    break;
  }
}
