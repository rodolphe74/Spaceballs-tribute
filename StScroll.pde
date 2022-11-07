float fov = PI / 3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
PFont font;
float fontSize = 18;
float y = 0;
float zGap = 600;
float yGap = 200;
float zPointAt = 400;

ArrayList<String> scrollLines = new ArrayList();

int starsCount = 1200;
float stars[][] = new float[starsCount][3];

void settings() {
  size(1024, 768, P3D);
  font = loadFont("Consolas-64.vlw");

  // Once upon a time
  scrollLines.add("In a galaxy very, very, very,");
  scrollLines.add("very, far  away  there  lived");
  scrollLines.add("a  ruthless  race  of  beings");
  scrollLines.add("known as . . . Spaceballs.   ");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("Chapter Eleven");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("The evil  leaders  of  Planet");
  scrollLines.add("Spaceball,  having  foolishly");
  scrollLines.add("squandered   their   precious");
  scrollLines.add("atmosphere,  have  devised  a");
  scrollLines.add("secret  plan  to  take  every");
  scrollLines.add("breath  of  air   away   from");
  scrollLines.add("their peace-loving neighbour,");
  scrollLines.add("Planet Druidia.              ");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("Today  is  Princess   Vespa's");
  scrollLines.add("wedding   day.    Unbeknownst");
  scrollLines.add("to the princess  but  knownst");
  scrollLines.add("to us, danger  lurks  in  the");
  scrollLines.add("stars above...               ");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("");
  scrollLines.add("If you  can  read  this,  you");
  scrollLines.add("don't need glasses.          ");

  for (int i = 0; i < starsCount; i++) {
    stars[i][0] = (float) Math.random() * width;
    stars[i][1] = (float) Math.random() * height;
    stars[i][2] = 500;
  }
}


void starsIter() {
  for (int i = 0; i < stars.length; i++) {
    stars[i][2] += 0.02f;
    stars[i][1] -= 0.02f;
  }
}



void draw() {
  background(0);
  fill(131, 201, 244);

  // perspective
  perspective(fov, float(width) / float(height), cameraZ / 10.0, cameraZ * 10.0);

  // overhanging camera
  camera(
    width/2.0,
    height / 2.0 - height / 4,
    (height/2.0) / tan(PI*30.0 / 180.0),
    width/2.0,
    height/2.0,
    zPointAt,
    0,
    1,
    0);

  // overoverhanging
  // camera(width/2.0, height / 2.0 - height / 4 - yGap, 0, width/2.0, height/2.0, 0, 0, 0, 1);


  // text properties
  textFont(font, fontSize);
  float textW;
  int countLine = 0;
  for (String line : scrollLines) {
    pushMatrix();
    textW = textWidth(line);
    translate(width / 2 - textW / 2, height / 2, zGap - y + fontSize * countLine);
    rotateX((float) Math.PI / 2);
    text(line, 0, 0, 0);
    popMatrix();
    countLine++;
  }
  
  smooth();
  stroke(131, 201, 244);
  strokeWeight(1.5);
  for (int i = 0; i < stars.length; i++) {
    point(stars[i][0], stars[i][1], stars[i][2]);
  }
  starsIter();

  y += 0.2;
}
