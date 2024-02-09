BarChart barChart;

void setup() {
  barChart = caso(1);
}

void draw() {
  barChart.draw();
}

BarChart caso(int caseNum) {
    BarChart ventas = new BarChart();
    ventas.setData(new float[] { 17, 50.5, 30, 40, 10, 33.24, 90.12 } );
    if (caseNum <= 1) return ventas; // CASE 1
    ventas.setMinMaxValor(0, 100);
    if (caseNum <= 2) return ventas; // CASE 2
    ventas.setBarGap(10);
    if (caseNum <= 3) return ventas; // CASE 3
    ventas.setBarLabels(new String[] {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio" } );
    if (caseNum <= 4) return ventas; // CASE 4
    ventas.setBackgroundColor(color(250, 250, 0));
    ventas.setBarColor(color(250, 0, 250));
    ventas.setAxisColor(color(0, 250, 250));
    ventas.setLabelColor(color(0, 0, 0));
    return ventas;
}
