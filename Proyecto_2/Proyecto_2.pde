boolean play = false;
Person person;
PImage bg;
boolean mousePressedLastFrame = false;

void setup() {
    size(2046 / 2, 1536 / 2);
    // Set image as background
    bg = loadImage("./Assets/cityscene/background.png");
    // Scale image to fit screen
    bg.resize(width, height);
    person = new Person(0, 300);
}

void draw() {
    frameRate(60);
    // Draw background
    background(bg);
    // Registering mouse clicks
    if (mousePressed && !mousePressedLastFrame) {
        play = !play;
        mousePressedLastFrame = true;
    } else if (!mousePressed) {
        mousePressedLastFrame = false;
    }
    // Move person
    if (play) {
        person.movePerson();
    }
    // Draw person
    person.draw();
}
