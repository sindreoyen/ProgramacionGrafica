public class BarChart {
  // --- 1 Attributes ---
  // --------------------
  // -- 1.1 Data --
  /** The data to be displayed */
  private float[] data = null;
  /** The minimum value of the data shown in the chart */
  private int minValor = -1;
  /** The maximum value of the data shown in the chart */
  private int maxValor = -1;

  // -- 1.2 Layout --
  /** The gap between the bars */
  private int barGap = 4;
  /** The labels of the bars */
  private String[] barLabels;
  /** The color of the bars */
  private color barColor = color(130);
  /** The background color of the chart */
  private color backgroundColor = color(0);
  /** The axis color of the chart */
  private color axisColor = color(255);
  /** The color of the labels */
  private color labelColor = color(255);

  // -- 1.3 General --
  private int chartOffset = 60;


  // --- 2 Constructors ---
  // ----------------------
  /** Create a new bar chart instance */
  public BarChart() { setup(); }
  private void setup() { size(800, 600); }
  
  // --- 3 Methods ---
  // -----------------
  // -- 3.1 Drawing --
  /** Draw the bar chart */
  void draw() {
    drawChart();
    drawAxis();
  }
  private void drawAxis() {
    // Drawing a line for the y and x axis
    stroke(axisColor);
    line(chartOffset, height - chartOffset, width - chartOffset, height - chartOffset);
    line(chartOffset, height - chartOffset, chartOffset, chartOffset);
  }
  private void drawLabels(float barWidth) {
    // Drawing the labels for the y axis
    fill(labelColor);
    textAlign(RIGHT, CENTER);
    // Min max values
    if (minValor != maxValor) {
      text(minValor, chartOffset - 10, height - chartOffset);
      text(maxValor, chartOffset - 10, chartOffset);
    }
    // Drawing on the y axis the labels for the data values
    for(int i = 0; i < data.length; i++) {
      // Drawing the y value on the y axis at the height of the bar
      float x = chartOffset - 10;
      float barHeight = map(min(data[i] / (maxValor / max(data)), maxValor), 0, maxValor, 0, height - chartOffset * 2);
      float y = height - chartOffset - barHeight;
      text(int(data[i]), x, y);
    }
    // Drawing the labels for the x axis
    if (barLabels != null) {
      textAlign(CENTER, CENTER);
      for (int i = 0; i < barLabels.length; i++) {
        float x = chartOffset + i * barWidth + (i + 1) * barGap + barWidth / 2;
        text(barLabels[i], x, height - chartOffset + 10);
      }
    }
  }
  private void drawChart() {
    if (data == null) return;

    background(backgroundColor);
    float barWidth = (width - chartOffset - barGap * (data.length + 1)) / data.length;
    float max = max(data);
    drawBars(barWidth, max);
    drawLabels(barWidth);
  }
  private void drawBars(float barWidth, float max) {
    for (int i = 0; i < data.length; i++) {
      // Calculating the needed variables
      float scaleDiff = maxValor / max;
      float x = chartOffset + i * barWidth + (i + 1) * barGap;
      float barHeight = map(min(data[i] / scaleDiff, max), 0, maxValor, 0, height - chartOffset * 2);
      // Calculate the color of the bar
      if (mouseX > x && mouseX < x + barWidth && mouseY > height - barHeight - chartOffset && mouseY < height - chartOffset) {
        // Illustrating the value of the selected bar
        textAlign(CENTER, CENTER);
        text(data[i], x + barWidth / 2, height - barHeight - chartOffset - 10);
        // Setting the color of the bar
        fill(255 - red(barColor), 100, 255 - blue(barColor));
      }
      else { fill(barColor); }
      // Draw the rect of the bar
      rect(x, height - barHeight - chartOffset, barWidth, barHeight);
    }
  }

  // -- 3.2 Getters and setters --
  void setData(float[] data) { 
    this.data = data; 
    float minData = min(data);
    if (minValor == -1) minValor = minData > 0 ? 0 : int(minData - 1);
    if (maxValor == -1) maxValor = int(max(data));
  }
  void setBarGap(int barGap) { this.barGap = barGap; }
  void setBarColor(color barColor) { this.barColor = barColor; }
  void setBackgroundColor(color backgroundColor) { this.backgroundColor = backgroundColor; }
  void setAxisColor(color axisColor) { this.axisColor = axisColor; }
  void setLabelColor(color labelColor) { this.labelColor = labelColor; }
  void setMinMaxValor(int minValor, int maxValor) {
    this.minValor = minValor;
    this.maxValor = maxValor;
  }
  void setBarLabels(String[] barLabels) {
    if (barLabels.length != data.length) throw new IllegalArgumentException("The number of labels must be equal to the number of bars");
    this.barLabels = barLabels;
  }
}
