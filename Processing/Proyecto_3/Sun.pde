public class Sun {
    // --- 1 Attributes ---
    // ---------------------
    private float x;
    private float y;
    private PImage image;

    // --- 2 Constructors ---
    // ----------------------
    public Sun(float x, float y) {
        this.x = x;
        this.y = y;
        this.image = loadImage("https://github.com/V-ktor/stce1/blob/master/images/background/sun_orange.png?raw=true");
        this.image.resize(150, 150);
    }

    // --- 3 Methods ---
    // ------------------
    public void draw() {
        imageMode(CENTER);
        image(this.image, this.x, this.y);
    }
    public float getX() { return this.x; }
    public float getY() { return this.y; }
}