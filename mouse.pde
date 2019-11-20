void mouseEntered() {
  mousePresent = true;
}

void mouseExited() {
  mousePresent = false;
}

void setmXmY() {
  if (mousePresent && !finished) {
    mX = int((mouseX - offMouseX) / scale);
    mY = int((mouseY - offMouseY) / scale);
    if ((mX >= 0 && mX <= 8) && (mY >= 0 && mY <= 8)) {
      mouseValid = !gridBool[int(mX / 3)][int(mY / 3)][int(mX % 3)][int(mY % 3)];
    } else {
      mouseValid = false;
    }
  } else {
    mX = -1;
    mY = -1;
    mouseValid = false;
  }
}

void mouseReleased() {
  if (mousePresent) {
    if (finished) {
      if ((mouseX >= offMouseX && mouseX <= (width - offMouseX)) && (mouseY >= offMouseY && mouseY <= (height - offMouseY))) {
        newGame();
      }
    } else if (pause) {
      pause = false;
    } else {
      setmXmY();
      if (mouseValid) {
        if (mX == selectX && mY == selectY) {
          selectX = -1;
          selectY = -1;
        } else {
          selectX = mX;
          selectY = mY;
        }
      }
    }

    if (mouseX >= width - (offMouseX / 1.2) && mouseX <= width - (offMouseX / 6.0)) {
      if (mouseY <= (height / 2.0) - ((offMouseX / 3.0) * 2.2) + (offMouseX / 6.0) && mouseY >= (height / 2.0) - ((offMouseX / 3.0) * 2.2) - (offMouseX / 6.0)) {
        level = constrain(level + 1, 1, 9);
      } else if (mouseY >= (height / 2.0) + ((offMouseX / 3.0) * 1.6) - (offMouseX / 6.0) && mouseY <= (height / 2.0) + ((offMouseX / 3.0) * 1.6) + (offMouseX / 6.0)) {
        level = constrain(level - 1, 1, 9);
      }
    }

    if ((mouseX >= width - (offMouseX / 2.0) - (offMouseX * 0.45) && mouseX <= width - (offMouseX / 2.0) + (offMouseX * 0.45)) && (mouseY >= (height / 13.0) * 11.65 - (height / 11) && mouseY <= (height / 13.0) * 11.65 + (height / 11))) {
      newGame();
    }
  }
}

void mouseWheel(MouseEvent event) {
  if (mousePresent) {
    if ((mouseX >= width - (offMouseX / 1.2) && mouseX <= width - (offMouseX / 6.0)) && (abs(mouseY - (height / 2.0)) <= offMouseX / 1.2)) {
      level = constrain(level - event.getCount(), 1, 9);
    }
  }
}
