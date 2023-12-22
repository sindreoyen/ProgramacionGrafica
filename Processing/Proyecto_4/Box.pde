public class Box {
    // --- 1 Attributes ---
    // --------------------
    private PVector position;
    private float size;

    // --- 2 Constructor ---
    // ---------------------
    public Box(PVector position, float size) {
        this.position = position;
        this.size = size;
    }

    // --- 3 Methods ---
    // -----------------
    public void draw() {
        fill(10, 200, 90);
        stroke(0);
        strokeWeight(6);
        pushMatrix();
        translate(position.x, position.y, position.z);
        box(size);
        popMatrix();
    }
}