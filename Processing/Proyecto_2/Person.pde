public class Person {
    // --- 1 Attributes ---
    // ------------------
    /** The x coordinate of the person. */
    private float x;
    /** The y coordinate of the person. */
    private float y;
    /** The current state of the sprite of the person. */
    private PImage sprite;
    /** The available sprites for the person. */
    private PImage[] sprites;

    // --- 2 Constructor ---
    // -------------------
    public Person(float x, float y) {
        this.x = x;
        this.y = y;
        // Load the sprites from Assets/cityscrene/capguy/walk
        sprites = new PImage[8];
        for (int i = 1; i <= 8; i++) {
            sprites[i - 1] = loadImage("./Assets/cityscene/capguy/walk/" + "000" + i + ".png");
        }
        sprite = sprites[0];
    }

    // --- 3 Methods ---
    // ---------------

    // -- 3.1 Draw and move --
    /** Draws the person on the screen. */
    public void draw() {
        image(sprite, x, y);
    }
    /** Moves the person. */
    public void movePerson() {
        // Move the person
        move(1.5, 0);
        // Change the sprite
        sprite = sprites[(int) (frameCount / 10) % 8];
    }
    private void move(float dx, float dy) {
        x += dx;
        y += dy;

        // Check if the person is out of bounds
        if (x > width + sprite.width) {
            x = -sprite.width;
        }
    }

    // -- 3.2 Getters --
    public float getX() {
        return x;
    }
    public float getY() {
        return y;
    }
    public PImage getSprite() {
        return sprite;
    }
}
