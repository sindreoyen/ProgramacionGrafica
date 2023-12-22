import peasy.*;

RubiksCube cube;
private PeasyCam cam;

void setup() {
    size(800, 800, P3D);
    cam = new PeasyCam(this, 0, 0, 0, 500);
    cube = new RubiksCube(width/2, height/2);
}

void draw() {
    background(0);
    cube.draw();
}
