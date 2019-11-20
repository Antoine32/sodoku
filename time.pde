void time() {
  textAlign(CENTER, CENTER);
  fill(MENU_TEXT_COL);
  textSize(offMouseX / 5.0);
  text("TEMPS", offMouseX / 2.0, height / 16.0);
  fill(MENU_TEXT_COL);
  textAlign(CENTER, CENTER);
  textSize(offMouseX / 1.5);
  if (pause) {
    clock = millis() - timePause;
  }
  float time = float(millis() - clock) / 1000.0;

  if (time < 3600 && !finished) {
    hourS = "00";
  } else if (!finished) {
    hourS = "";
    int hour = int(time / 3600);
    if (hour < 10) {
      hourS += "0";
    }
    hourS += hour;
  }
  text(hourS, offMouseX / 2.0, (height / 16.0) * 4.0);
  time %= 3600.0;

  if (time < 60 && !finished) {
    minS = "00";
  } else if (!finished) {
    minS = "";
    int min = int(time / 60);
    if (min < 10) {
      minS += "0";
    }
    minS += min;
  }
  text(minS, offMouseX / 2.0, (height / 16.0) * 8.0);
  time %= 60.0;

  if (time < 1 && !finished) {
    secS = "00";
  } else if (!finished) {
    secS = "";
    int sec = int(time / 1);
    if (sec < 10) {
      secS += "0";
    }
    secS += sec;
  }
  text(secS, offMouseX / 2.0, (height / 16.0) * 12.0);
  time %= 1;
}
