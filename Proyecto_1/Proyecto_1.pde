BarChart barChart;

void setup() {
  barChart = new BarChart();
  barChart.setData(new float[] { 17, 50.5, 30, 40, 10, 33.24, 90.12 });
  barChart.setBarGap(5);
  barChart.setMinMaxValor(0, 100);
  barChart.setBarLabels(new String[] {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio" } );
}

void draw() {
  barChart.draw();
}