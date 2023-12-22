public class Moon {
    // --- 1 Attributes ---
    // ---------------------
    private float t;
    private float x;
    private float y;
    private Orbit orbit;
    private PImage image;
    private Earth earth;

    // --- 2 Constructors ---
    // ----------------------
    public Moon(Earth earth) {
        this.t = 0;
        this.earth = earth;
        this.orbit = new Orbit(earth.getX(), earth.getY(), 70, 60);
        this.image = loadImage("https://github.com/V-ktor/stce1/blob/master/images/planets/moon02.png?raw=true");
        image.resize(20, 20);
    }

    // --- 3 Methods ---
    // ------------------
    // -- 3.0 Update --
    private void update() {
        this.t += 1.3;
        this.orbit.updateCenter(this.earth.getX(), this.earth.getY());
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