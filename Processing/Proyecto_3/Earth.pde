public class Earth {
    // --- 1 Attributes ---
    // ---------------------
    private float t;
    private float x;
    private float y;
    private Orbit orbit;
    private PImage image;

    // --- 2 Constructors ---
    // ----------------------
    public Earth(Sun sun) {
        this.t = 0;
        this.x = 0;
        this.y = 0;
        this.orbit = new Orbit(sun.getX(), sun.getY(), 350, 320);
        this.image = loadImage("https://github.com/V-ktor/stce1/blob/master/images/planets/planet_32.png?raw=true");
        image.resize(40, 40);
    }

    // --- 3 Methods ---
    // ------------------
    // -- 3.0 Update --
    private void update() {
        this.t += 0.4;
        float[] pos = this.orbit.getPositionAt(radians(this.t));
        this.x = pos[0];
        this.y = pos[1];
    }
    // -- 3.1 Drawing --
    public void draw() {
        update();
        imageMode(CENTER);
        // Rotate and draw the image
        pushMatrix();
        translate(this.x, this.y);
        rotate(radians(this.t));
        image(this.image, 0, 0);
        popMatrix();
    }
    // -- 3.2 Getters --
    public float getX() {
        return this.x;
    }
    public float getY() {
        return this.y;
    }
}