$(function(){
	
	//加载合同交付饼图
	contractPayChart();
	
	//加载合同付款饼图
	//contractPaymentChart();
	
//	mui(".mui-table-view").on("tap",".mui-table-view-cell",function(){
//		if($(this).index() === 1){
//			if($(this).find(".contractPaymentChart").html() === ""){
//				setTimeout(function(){
//					//加载合同付款饼图
//					contractPaymentChart();
//				},0);
//			}
//		}else if($(this).index() === 2){
//			if($(this).find(".contractServiceChart").html() === ""){
//				setTimeout(function(){
//					//加载合同维保饼图
//					contractServiceChart();
//				},0);
//			}
//		}
//	});


	mui(".mui-table-view").on("tap",".mui-navigate-right",function(){
		if($(this).parent(".mui-table-view-cell").index() === 1){
			if($(this).parent(".mui-table-view-cell").find(".contractPaymentChart").html() === ""){
				setTimeout(function(){
					//加载合同付款饼图
					contractPaymentChart();
				},0);
			}
		}else if($(this).parent(".mui-table-view-cell").index() === 2){
			if($(this).parent(".mui-table-view-cell").find(".contractServiceChart").html() === ""){
				setTimeout(function(){
					//加载合同维保饼图
					contractServiceChart();
				},0);
			}
		}
	});
	
	//点击工程周报按钮
	$(".contractPayChartLink_1").click(function(){
		mui.openWindow({
			url : $(this).attr("href")
		})
	});

	//点击工程周报按钮
	$(".contractServiceLink_1").click(function(){
		mui.openWindow({
			url : $(this).attr("href")
		})
	});
	
	
})

//加载合同交付饼图
function contractPayChart(){
	var chart;
    require([
        'echarts'
        // 'echarts/chart/pie',
        // 'echarts/component/legend',
        // 'echarts/component/grid',
        // 'echarts/component/tooltip',
        // 'echarts/component/toolbox'
    ], function (echarts) {

        chart = echarts.init(document.getElementById('contractPayChart'));

        // Pencil sketch texture
        var patternSrc = window.pieTexture;
        var img = new Image();
        img.src = patternSrc;

        var itemStyle = {
            normal: {
                opacity: 0.7,
                color: {
                    image: img,
                    repeat: 'repeat'
                },
                borderWidth: 3,
                borderColor: '#235894'
            }
        };
        chart.setOption({
            series: [{
                name: 'pie',
                type: 'pie',
                selectedMode: 'single',
                selectedOffset: 30,
                clockwise: true,
                labelLine: {
                    lineStyle: {
                        color: '#333'
                    }
                },
                data:[
                    {
                        value:235,
                        name:'启动',
                        cursor: 'move',
                        selected: true,
                        label: {
                            normal: {
                                position: 'inside',
                                formatter: '{b}：\n{d}%'
                            }
                        }
                    },
                    {value: 163, name: '到货',
                        label: {
                            normal: {
                                position: 'inside',
                                formatter: '{b}：\n{d}%'
                            }
                        }
                    },
                    {value:310, name:'完工', 
                    	label: {
                            normal: {
                                position: 'inside',
                                formatter: '{b}：\n{d}%'
                            }
                        }
                    	},
                    {value:234, name:'验收', 
                    	label: {
                            normal: {
                                position: 'inside',
                                formatter: '{b}：\n{d}%'
                            }
                        }
	                },
                ],
                itemStyle: itemStyle
            }]
        });

    })
}

//加载合同付款饼图
function contractPaymentChart(){
	require([
        'echarts'
        // 'echarts/chart/bar',
        // 'echarts/component/legend',
        // 'echarts/component/grid',
        // 'echarts/component/tooltip'
    ], function (echarts) {

        var chart = echarts.init(document.getElementById('contractPaymentChart'), null, {});

        var labelOption = {
            normal: {
                show: true,
                position: 'insideBottom',
                rotate: 90,
                textStyle: {
                    align: 'left',
                    verticalAlign: 'middle'
                }
            }
        };

        option = {
            color: ['#007aff', '#006699', '#4cabce', '#e5323e'],
			grid : {
				x : "40rem",
				y : "30rem",
				x2 : "30rem",
				y2 : "30rem"
			},
            calculable: true,
            xAxis: [
                {
                    type: 'category',
                    axisTick: {show: false},
                    data: ['1付','2付','3付']
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '合同付款',
                    type: 'bar',
                    barGap: 0,
                    label: labelOption,
                    barWidth : "60rem",
                    data: [320, 332, 301]
                }
            ]
        }

        chart.setOption(option);
    });
}

//加载合同维保饼图
function contractServiceChart(){
	require([
        'echarts'
        // 'echarts/chart/pie',
        // 'echarts/component/title',
        // 'echarts/component/legend',
        // 'echarts/component/tooltip'
    ], function (echarts) {

        var chart1 = echarts.init(document.getElementById('contractServiceChart'), null, {});

        chart1.setOption({
        	color : ["#0f86e6","#a6a6a6"],
//          title: {
//              text: 'hoverOffset: 10'
//          },
//          tooltip: {
//              position: ['50%', '50%'],
//              backgroundColor: 'trasparent',
//              formatter: function (params) {
//                  return '<div class="tooltip-content">\
//                      <h4>' + params.name + '</h4>\
//                      <h5>' + (params.percent * 100).toFixed(1) + '%</h5>\
//                      </div>\
//                  ';
//              }
//          },
            series: [{
                name: 'pie',
                type: 'pie',
                selectedMode: 'single',
                selectedOffset: 30,
                clockwise: true,
                radius: ['60%', '80%'],
                label: {
                    normal: {
                        show: false
                    }
                },
                labelLine: {
                    show: false
                },
                data:[
                    {value:1095, name:'维保天数',
                    	"label": {
                    		"normal": {
                    			"formatter":"{d}%", 
                    			"position": "center",
                    			"show": true,
                    			"textStyle": {
                    				"fontSize": "28",
                    				"fontWeight": "normal",
                    				"color": "#0f86e6"
                    			}
                    		}
                    	}
                    },
                    {value:383, name:'剩余天数'}
                ]
            }]
        });


    });
}
