public class RubiksCube {
    // --- 1 Attributes ---
    // --------------------
    private Box[][][] cube = new Box[3][3][3];

    // --- 2 Constructors ---
    // ----------------------
    public RubiksCube(float x, float y) {
        setupBoxes();
    }
    
    // --- 3 Methods ---
    // -----------------
    private void setupBoxes() {
        // Creating all the boxes forming the cube
        int size = 35;
        int offset = (size * (cube.length - 1)) / 2;
        for (int i = 0; i < cube.length; i++) {
            for (int j = 0; j < cube.length; j++) {
                for (int k = 0; k < cube.length; k++) {
                    PVector pos = new PVector((i * size) - offset,(j * size) - offset, (k * size) - offset);
                    cube[i][j][k] = new Box(pos, size);
                }
            }
        }
    }
    public void draw() {
        // Drawing all the boxes forming the cube
        for (int i = 0; i < cube.length; i++) {
            for (int j = 0; j < cube.length; j++) {
                for (int k = 0; k < cube.length; k++) {
                    cube[i][j][k].draw();
                }
            }
        }
    }
}