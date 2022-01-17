PImage netherite;
PImage topGrass;
PImage dirt;
PImage sideGrass;

float rotx, roty;

void setup()
{
  size(800, 800, P3D);  
  netherite = loadImage("Netherite Block.png");
  topGrass = loadImage("Grass_Block_Top.png");
  dirt = loadImage("Grass_Block_Bottom.png");
  sideGrass = loadImage("Grass_Block_Side.png");
  
  textureMode(NORMAL);
}

void draw()
{
  background(255);
  
  texturedCube(width/2, height/2,  0, netherite, 200);
  texturedCube(100,100,100,dirt,100);
  texturedCube(600,600,100,topGrass, sideGrass, dirt, 150);
}

void texturedCube(float x, float y, float z, PImage texture, float size)
{
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS);
  texture(texture);
  
  //vertex(x, y, z, texture x, texture y);
  
  //top
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  
  //bottom
  vertex(0,1,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  
  //front
  vertex(0,0,1,0,0);
  vertex(1,0,1,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  
  //back
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,1,0,1,1);
  vertex(0,1,0,0,1);
  
  //left
  vertex(0,0,0,0,0);
  vertex(0,0,1,1,0);
  vertex(0,1,1,1,1);
  vertex(0,1,0,0,1);
  
  //right
  vertex(1,0,0,0,0);
  vertex(1,0,1,1,0);
  vertex(1,1,1,1,1);
  vertex(1,1,0,0,1);
  
  endShape();
  popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size)
{
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS);

  //vertex(x, y, z, texture x, texture y);
  //top
  texture(top);
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  
  endShape();
  
  //bottom
  beginShape(QUADS);
  texture(bottom);
  vertex(0,1,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  endShape();
  
  beginShape(QUADS);
  //front
  texture(side);
  vertex(0,0,1,0,0);
  vertex(1,0,1,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  
  //back
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,1,0,1,1);
  vertex(0,1,0,0,1);
  
  //left
  vertex(0,0,0,0,0);
  vertex(0,0,1,1,0);
  vertex(0,1,1,1,1);
  vertex(0,1,0,0,1);
  
  //right
  vertex(1,0,0,0,0);
  vertex(1,0,1,1,0);
  vertex(1,1,1,1,1);
  vertex(1,1,0,0,1);
  endShape();
  
  popMatrix();
}

void mouseDragged()
{
  rotx = rotx + (pmouseY-mouseY) * 0.01;
  roty = roty + (pmouseX - mouseX) * -0.01;
}
