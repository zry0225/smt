<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/27
  Time: 9:55 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/echarts.min.js"></script>
    <script src="/js/jquery.js"></script>
</head>
<body>
<style>
    body{
        background-image: url("/img/bg.png");
        background-repeat: no-repeat;
        opacity: 0.9;
    }
</style>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="age" style="width: 500px;height:400px; float: left;margin-top: 120px"></div>
<div id="sex" style="width: 400px;height:400px; float: right;margin-top: 120px"></div>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('sex'));

    // 指定图表的配置项和数据
    var option = {
        title : {
            left: 'center',
            subtext: '由注册用户信息得出',
            text : '旅客性别分析'
        },
        tooltip : {},
        legend : {
            data : [ '客情分析' ]
        },
        xAxis : {
            data : [
                <c:forEach var="i" begin="0" end="${sex.size()-1}"> '${sex[i].u_sex}', </c:forEach>
            ],
        },
        yAxis : {},
        series :[ {
            name : '性别',
            type : 'bar',
            data: [ <c:forEach var="i" begin="0" end="${sex.size()-1}"> '${sex[i].count}', </c:forEach>]
        } ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);


</script>

<script>
    var chartDom = document.getElementById('age');
    var myChart = echarts.init(chartDom);
    var option;

    var dataAxis = [<c:forEach var="i" begin="0" end="${age.size()-1}"> '${age[i].u_age}', </c:forEach>
    ];
    var data = [<c:forEach var="i" begin="0" end="${age.size()-1}"> '${age[i].count}', </c:forEach>];
    var yMax = 100;
    var dataShadow = [];

    for (var i = 0; i < data.length; i++) {
        dataShadow.push(yMax);
    }

    option = {
        title: {
            left:'center',
            text: '旅客年龄分析',
            subtext: '由注册用户信息得出'
        },
        xAxis: {
            name:"年龄",
            data: dataAxis,
            axisLabel: {
                inside: true,
                textStyle: {
                    color: '#fff'
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            z: 10
        },
        yAxis: {
            max : 10,
            min : 0,
            splitNumber : 5,
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: '#999'
                }
            }
        },
        dataZoom: [
            {
                type: 'inside'
            }
        ],
        series: [
            {
                type: 'bar',
                showBackground: true,
                itemStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#83bff6'},
                            {offset: 0.5, color: '#188df0'},
                            {offset: 1, color: '#188df0'}
                        ]
                    )
                },
                emphasis: {
                    itemStyle: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#2378f7'},
                                {offset: 0.7, color: '#2378f7'},
                                {offset: 1, color: '#83bff6'}
                            ]
                        )
                    }
                },
                data: data
            }
        ]
    };

   /* // Enable data zoom when user click bar.
    var zoomSize = 6;
    myChart.on('click', function (params) {
        console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
        myChart.dispatchAction({
            type: 'dataZoom',
            startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
            endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
        });
    });*/

    option && myChart.setOption(option);

</script>
</body>
</html>
