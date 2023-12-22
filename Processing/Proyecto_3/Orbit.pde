public class Orbit {
    // --- 1 Attributes ---
    // --------------------
    /** The x-center of the ellipse. */
    private float centerX;
    /** The y-center of the ellipse. */
    private float centerY;
    /** The semi-major axis of the ellipse. Aka the radius of the ellipse along the x-axis. */
    private float a; 
    /** The semi-minor axis of the ellipse. Aka the radius of the ellipse along the y-axis. */
    private float b;

    // --- 2 Constructors ---
    // ----------------------
    /**
    * Constructor for an ellipse with a given center and semi-major and semi-minor axes.
    * @param centerX The x-center of the ellipse.
    * @param centerY The y-center of the ellipse.
    * @param semiMajorAxis The semi-major axis of the ellipse. Aka the radius of the ellipse along the x-axis.
    * @param semiMinorAxis The semi-minor axis of the ellipse. Aka the radius of the ellipse along the y-axis.
    */
    public Orbit(float centerX, float centerY, float semiMajorAxis, float semiMinorAxis) {
        updateCenter(centerX, centerY);
        this.a = semiMajorAxis;
        this.b = semiMinorAxis;
    }

    // --- 3 Methods ---
    // -----------------
    public void updateCenter(float centerX, float centerY) {
        this.centerX = centerX;
        this.centerY = centerY;
    }

    // Method to calculate the position on the ellipse at a given parameter 't'
    public float[] getPositionAt(float t) {
        float x = this.centerX + this.a * (float) Math.cos(t);
        float y = this.centerY + this.b * (float) Math.sin(t);
        return new float[]{x, y};
    }
}
