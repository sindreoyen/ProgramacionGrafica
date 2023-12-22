PImage bg;
Sun sun;
Earth earth;
Moon moon;

void setup() {
    size(1200, 800);
    bg = loadImage("https://github.com/V-ktor/stce1/blob/master/images/background/stars.png?raw=true");
    bg.resize(width, height);
    sun = new Sun(width/2, height/2);
    earth = new Earth(sun);
    moon = new Moon(earth);
}

void draw() {
    // Stars
    background(bg);
    // Sun
    sun.draw();
    // Earth
    earth.draw();
    // Moon
    moon.draw();
}