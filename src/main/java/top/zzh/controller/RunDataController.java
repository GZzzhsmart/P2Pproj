package top.zzh.controller;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.renderers.JFreeChartRenderer;
import org.jfree.chart.ChartColor;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.RingPlot;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.StandardBarPainter;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import top.zzh.service.YdateService;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.HashMap;

@Controller
@RequestMapping("rundata")
public class RunDataController {

    @Autowired
    private YdateService ydateService;
    private Logger logger= LoggerFactory.getLogger(RunDataController.class);
    @GetMapping("createPdf/{yid}")
    public void createPdf(HttpServletRequest request, HttpServletResponse response, @PathVariable("yid")Long yid) {
        String path=request.getRealPath("/static/rundata/jrxml/rundata.jrxml");
        File file = new File(path);
        InputStream in;
        try {
            in = new FileInputStream(file);
            HashMap params = new HashMap();
            ydateService.setParames(params,yid);
            ydateService.setParamesPic(params,request);
//          createSexChart(params);//饼图
            ydateService.createRingChart(params);
            ydateService.createAgeChart(params);
            JasperReport jasperReport = JasperCompileManager.compileReport(in);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
                    params, new JREmptyDataSource());
//           JasperExportManager.exportReportToPdfFile(jasperPrint,"src/main/resources/rundata.jsp");
//
//            String jasperName= JasperCompileManager.compileReportToFile("src/main/resources/rundata/rundata.jrxml");
//            String printName= JasperFillManager.fillReportToFile(jasperName,params,new JREmptyDataSource());
//            JasperExportManager.exportReportToPdfFile(printName);


//              导出到浏览器下载目录
            response.setContentType("application/pdf");
            String fileName ="rundata.pdf";
            response.setHeader("Content-disposition", "attachment; filename=" + fileName);
            OutputStream outputStream=response.getOutputStream();
            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//以下代码转移到了YdateServiceImpl
// 以下代码转移到了YdateServiceImpl
//以下代码转移到了YdateServiceImpl
//以下代码转移到了YdateServiceImpl
//    public void setParames(HashMap params){
//        params.put("tmoney","1000000000" );//交易总额
//        params.put("mmoney","200000" );//月交易总额
//        params.put("tuser","30000" );//总用户数
//        params.put("muser","400" );//月用户数
//        params.put("ttzno","5800" );//总投资人数
//        params.put("mtzno","600" );//月投资人数
//        params.put("tdkno","700" );//总贷款人数
//        params.put("mdkno","80" );//月贷款人数
//        params.put("tdkbno","9000");//总贷款笔数
//        params.put("mdkbno","111");//月贷款笔数
//    }
//
//
//    public void setParamesPic(HashMap params,HttpServletRequest request){
//        Image tmoneyImg=null,tuserImg=null,ttznoImg=null,tdknoImg=null,tdkbnoImg=null;
//        try {
//            tmoneyImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/1.jpg")));
//            tuserImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/4.jpg")));
//            ttznoImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/1.jpg")));
//            tdknoImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/3.jpg")));
//            tdkbnoImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/5.jpg")));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        params.put("tmoneyImg",tmoneyImg);
//        params.put("tuserImg",tuserImg);
//        params.put("ttznoImg",ttznoImg);
//        params.put("tdknoImg",tdknoImg);
//        params.put("tdkbnoImg",tdkbnoImg);
//    }
//
//
//
//
//
////创建createSexChart
//    public void createSexChart(HashMap param){
//        DefaultPieDataset dateset = new DefaultPieDataset();
//        dateset.setValue("男生", 70);
//        dateset.setValue("女生", 30);
//        JFreeChart freeChart = ChartFactory.createPieChart3D("性别占比", dateset, true, true, false);
//
//        setSexChartFont(freeChart);
//        param.put("sexJfreeChart", new JFreeChartRenderer(freeChart));
//    }
//    public void setSexChartFont(JFreeChart chart){
//        Font titleFont = new Font("黑体", Font.BOLD, 20);
//        TextTitle textTitle = chart.getTitle();
//        textTitle.setFont(titleFont);// 为标题设置上字体
//
//        Font plotFont = new Font("宋体", Font.PLAIN, 16);
//        PiePlot3D plot = (PiePlot3D) chart.getPlot();
//        plot.setLabelFont(plotFont); // 为饼图元素设置上字体
//        plot.setNoDataMessage("没有数据显示");
//
//        Font LegendFont = new Font("楷体", Font.PLAIN, 18);
//        LegendTitle legend = chart.getLegend(0);
//        legend.setItemFont(LegendFont);// 为图例说明设置字体
//    }
//
//
//
////createAgeChart
//    public void createAgeChart(HashMap param){
//        DefaultCategoryDataset ds = new DefaultCategoryDataset();
//        ds.addValue(10, "18岁-24岁", "18岁-24岁");
//        ds.addValue(10, "25岁-29岁", "25岁-29岁");
//        ds.addValue(10, "30岁-34岁", "30岁-34岁");
//        ds.addValue(30, "35岁-39岁", "35岁-39岁");
//        ds.addValue(35, "40岁-49岁", "40岁-49岁");
//        ds.addValue(5, ">=50岁", ">=50岁");
//        JFreeChart chart = ChartFactory.createBarChart3D(
//                                     "各年龄段分布", //图表标题
//                                     "年龄段", //目录轴的显示标签
//                                     "百分比%", //数值轴的显示标签
//                                      ds, //数据集
//                                      PlotOrientation.HORIZONTAL, //图表方向
//                                     false, //是否显示图例，对于简单的柱状图必须为false
//                                     false, //是否生成提示工具
//                                    false);         //是否生成url链接
//        setAgeChartFont(chart);
//        param.put("ageJfreeChart",new JFreeChartRenderer(chart));
//    }
//    public void setAgeChartFont(JFreeChart chart){
//        CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();
//        NumberAxis numberaxis = (NumberAxis) categoryplot.getRangeAxis();
//        CategoryAxis domainAxis = categoryplot.getDomainAxis();
//        /*------设置X轴坐标上的文字-----------*/
//        domainAxis.setTickLabelFont(new Font("宋体", Font.PLAIN, 11));
//        /*------设置X轴的标题文字------------*/
//        domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));
//        /*------设置Y轴坐标上的文字-----------*/
//        numberaxis.setTickLabelFont(new Font("宋体", Font.PLAIN, 12));
//        /*------设置Y轴的标题文字------------*/
//        numberaxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));
////        /*------这句代码解决了底部汉字乱码的问题（图例的字体）-----------*/
////        chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));
//        /*******这句代码解决了标题汉字乱码的问题********/
//        chart.getTitle().setFont(new Font("宋体", Font.PLAIN, 12));
//    }
//
//
//
//
//
//    //创建ringChart
//    public void createRingChart(HashMap param){
//        DefaultPieDataset dataSet = new DefaultPieDataset();
//        dataSet.setValue("男生",70);
//        dataSet.setValue("女生",30);
//        JFreeChart chart = ChartFactory.createRingChart("性别环形图",// 报表题目，字符串类型
//                dataSet, // 获得数据集
//                true, // 显示图例
//                false, // 不用生成工具
//                false // 不用生成URL地址
//        );
//        chart.setBorderVisible(false);
//        chart.setBackgroundPaint(null);
//        chart.setBackgroundImageAlpha(0.0f);
//        setRingChartFont(chart);
//        param.put("sexJfreeChart",new JFreeChartRenderer(chart));
//    }
//    public void setRingChartFont(JFreeChart chart){
//        Font titleFont = new Font("黑体", Font.BOLD, 20);
//        TextTitle textTitle = chart.getTitle();
//        textTitle.setFont(titleFont);// 为标题设置上字体
//
//        Font plotFont = new Font("宋体", Font.PLAIN, 16);
//        RingPlot plot = (RingPlot) chart.getPlot();
//        plot.setLabelFont(plotFont); // 为饼图元素设置上字体
//
//        Font LegendFont = new Font("楷体", Font.PLAIN, 18);
//        LegendTitle legend = chart.getLegend(0);
//        legend.setItemFont(LegendFont);// 为图例说明设置字体
//    }

}
