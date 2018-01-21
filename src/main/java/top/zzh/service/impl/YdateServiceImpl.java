package top.zzh.service.impl;

import net.sf.jasperreports.renderers.JFreeChartRenderer;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.RingPlot;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.YDate;
import top.zzh.common.Pager;
import top.zzh.dao.YdateDAO;
import top.zzh.service.YdateService;
import top.zzh.vo.TicketVo;
import top.zzh.vo.YdateVo;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

@Service
public class YdateServiceImpl implements YdateService{
    @Autowired
    private YdateDAO ydateDAO;
    @Override
    public void save(Object obj) {
        ydateDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(Object obj) {
        ydateDAO.update(obj);
    }

    @Override
    public Object getById(Long id) {
        return ydateDAO.getById(id);
    }

    @Override
    public List<Object> listAll() {
        return ydateDAO.listAll();
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        return null;
    }

    @Override
    public YdateVo getByMaxDate() {
        return ydateDAO.getByMaxDate();
    }

    @Override
    public List<YdateVo> selectIdAndDate() {
        return ydateDAO.selectIdAndDate();
    }

    @Override
    public BigDecimal countTzbMoney() {
        return ydateDAO.countTzbMoney();
    }

    @Override
    public BigDecimal countMtzbMoney() {
        return ydateDAO.countMtzbMoney();
    }

    @Override
    public Integer countUserUid() {
        return ydateDAO.countUserUid();
    }

    @Override
    public Integer countMuserUid() {
        return ydateDAO.countMuserUid();
    }

    @Override
    public Integer countTzbTzid() {
        return ydateDAO.countTzbTzid();
    }

    @Override
    public Integer countMtzbTzid() {
        return ydateDAO.countMtzbTzid();
    }

    @Override
    public Integer countBApplyBaid() {
        return ydateDAO.countBApplyBaid();
    }

    @Override
    public Integer countMbApplyBaid() {
        return ydateDAO.countMbApplyBaid();
    }

    @Override
    public Integer countBApplyConBaid() {
        return ydateDAO.countBApplyConBaid();
    }

    @Override
    public Integer countMbApplyConBaid() {
        return ydateDAO.countMbApplyConBaid();
    }


    @Override
    public void setParames(HashMap params,Long yid){
        YdateVo yDate=(YdateVo)ydateDAO.getById(yid);
        params.put("tmoney",yDate.getTmoney() );//交易总额
        params.put("mmoney",yDate.getMmoney() );//月交易总额
        params.put("tuser",yDate.getTuser());//总用户数
        params.put("muser",yDate.getMuser());//月用户数
        params.put("ttzno",yDate.getTtzno());//总投资人数
        params.put("mtzno",yDate.getMtzno());//月投资人数
        params.put("tdkno",yDate.getTdkno());//总贷款人数
        params.put("mdkno",yDate.getMdkno());//月贷款人数
        params.put("tdkbno",yDate.getTdkbno());//总贷款笔数
        params.put("mdkbno",yDate.getMdkno());//月贷款笔数
        params.put("createTime",yDate.getDate());//创建时间
        String createMonth=yDate.getDate().substring(5,7);
        if(createMonth.substring(0,1).equals("0")){
            createMonth=createMonth.substring(1,2);
        }
        params.put("createMonth",createMonth);//创建月份
    }

    @Override
    public void setParamesPic(HashMap params,HttpServletRequest request){
        Image tmoneyImg=null,tuserImg=null,ttznoImg=null,tdknoImg=null,tdkbnoImg=null;
        try {
            tmoneyImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/1.jpg")));
            tuserImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/4.jpg")));
            ttznoImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/1.jpg")));
            tdknoImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/3.jpg")));
            tdkbnoImg = ImageIO.read(new FileInputStream(request.getRealPath("/static/images/rundata/5.jpg")));
        } catch (IOException e) {
            e.printStackTrace();
        }
        params.put("tmoneyImg",tmoneyImg);
        params.put("tuserImg",tuserImg);
        params.put("ttznoImg",ttznoImg);
        params.put("tdknoImg",tdknoImg);
        params.put("tdkbnoImg",tdkbnoImg);
    }





    //创建createSexChart
    @Override
    public void createSexChart(HashMap param){
        DefaultPieDataset dateset = new DefaultPieDataset();
        dateset.setValue("男生", 70);
        dateset.setValue("女生", 30);
        JFreeChart freeChart = ChartFactory.createPieChart3D("性别占比", dateset, true, true, false);

        setSexChartFont(freeChart);
        param.put("sexJfreeChart", new JFreeChartRenderer(freeChart));
    }
    public void setSexChartFont(JFreeChart chart){
        Font titleFont = new Font("黑体", Font.BOLD, 20);
        TextTitle textTitle = chart.getTitle();
        textTitle.setFont(titleFont);// 为标题设置上字体

        Font plotFont = new Font("宋体", Font.PLAIN, 16);
        PiePlot3D plot = (PiePlot3D) chart.getPlot();
        plot.setLabelFont(plotFont); // 为饼图元素设置上字体
        plot.setNoDataMessage("没有数据显示");

        Font LegendFont = new Font("楷体", Font.PLAIN, 18);
        LegendTitle legend = chart.getLegend(0);
        legend.setItemFont(LegendFont);// 为图例说明设置字体
    }

    //createAgeChart
    @Override
    public void createAgeChart(HashMap param){
        DefaultCategoryDataset ds = new DefaultCategoryDataset();
        ds.addValue(10, "18岁-24岁", "18岁-24岁");
        ds.addValue(10, "25岁-29岁", "25岁-29岁");
        ds.addValue(10, "30岁-34岁", "30岁-34岁");
        ds.addValue(30, "35岁-39岁", "35岁-39岁");
        ds.addValue(35, "40岁-49岁", "40岁-49岁");
        ds.addValue(5, ">=50岁", ">=50岁");
        JFreeChart chart = ChartFactory.createBarChart3D(
                "各年龄段分布", //图表标题
                "年龄段", //目录轴的显示标签
                "百分比%", //数值轴的显示标签
                ds, //数据集
                PlotOrientation.HORIZONTAL, //图表方向
                false, //是否显示图例，对于简单的柱状图必须为false
                false, //是否生成提示工具
                false);         //是否生成url链接
        setAgeChartFont(chart);
        param.put("ageJfreeChart",new JFreeChartRenderer(chart));
    }
    public void setAgeChartFont(JFreeChart chart){
        CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();
        NumberAxis numberaxis = (NumberAxis) categoryplot.getRangeAxis();
        CategoryAxis domainAxis = categoryplot.getDomainAxis();
        /*------设置X轴坐标上的文字-----------*/
        domainAxis.setTickLabelFont(new Font("宋体", Font.PLAIN, 11));
        /*------设置X轴的标题文字------------*/
        domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));
        /*------设置Y轴坐标上的文字-----------*/
        numberaxis.setTickLabelFont(new Font("宋体", Font.PLAIN, 12));
        /*------设置Y轴的标题文字------------*/
        numberaxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));
//        /*------这句代码解决了底部汉字乱码的问题（图例的字体）-----------*/
//        chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));
        /*******这句代码解决了标题汉字乱码的问题********/
        chart.getTitle().setFont(new Font("宋体", Font.PLAIN, 12));
    }





    //创建ringChart
    @Override
    public void createRingChart(HashMap param){
        DefaultPieDataset dataSet = new DefaultPieDataset();
        dataSet.setValue("男生",70);
        dataSet.setValue("女生",30);
        JFreeChart chart = ChartFactory.createRingChart("性别环形图",// 报表题目，字符串类型
                dataSet, // 获得数据集
                true, // 显示图例
                false, // 不用生成工具
                false // 不用生成URL地址
        );
        chart.setBorderVisible(false);
        chart.setBackgroundPaint(null);
        chart.setBackgroundImageAlpha(0.0f);
        setRingChartFont(chart);
        param.put("sexJfreeChart",new JFreeChartRenderer(chart));
    }
    public void setRingChartFont(JFreeChart chart){
        Font titleFont = new Font("黑体", Font.BOLD, 20);
        TextTitle textTitle = chart.getTitle();
        textTitle.setFont(titleFont);// 为标题设置上字体

        Font plotFont = new Font("宋体", Font.PLAIN, 16);
        RingPlot plot = (RingPlot) chart.getPlot();
        plot.setLabelFont(plotFont); // 为饼图元素设置上字体

        Font LegendFont = new Font("楷体", Font.PLAIN, 18);
        LegendTitle legend = chart.getLegend(0);
        legend.setItemFont(LegendFont);// 为图例说明设置字体
    }

}
