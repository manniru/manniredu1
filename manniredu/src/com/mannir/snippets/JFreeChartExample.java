package com.mannir.snippets;

import javax.swing.JFrame;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.util.Rotation;

public class JFreeChartExample extends JFrame {

  public JFreeChartExample
  	(String frameTitle, String chartTitle) {
        super(frameTitle);
        //Creates a sample defaultPieDataset
        DefaultPieDataset defaultPieDataset =
        	new DefaultPieDataset();
        defaultPieDataset.setValue("c/c++", 19);
        defaultPieDataset.setValue("java", 46);
        defaultPieDataset.setValue("php", 35);
       
        // based on the defaultPieDataset 
        // we create the chart
        JFreeChart pieChart =
        	ChartFactory.createPieChart3D(chartTitle, 
        defaultPieDataset, true, true, false);
        PiePlot plot = (PiePlot) pieChart.getPlot();
        plot.setStartAngle(290);
        plot.setDirection(Rotation.CLOCKWISE);
        plot.setForegroundAlpha(0.5f);

        // Adding chart into a chart panel
        ChartPanel chartPanel =
        	new ChartPanel(pieChart);
       
        // setting default size
        chartPanel.setPreferredSize
        	(new java.awt.Dimension(300, 200));
       
        // add to contentPane
        setContentPane(chartPanel);
    }
    public static void main(String[] args) {
      JFreeChartExample chart = new
      	JFreeChartExample("Language Usage Statistics", "Which language are you Learning?");
        chart.pack();
        chart.setVisible(true);
    }
}
