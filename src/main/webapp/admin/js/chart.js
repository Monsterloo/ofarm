var ChartObj = {};
var dataChar = new Array();
var dataName = new Array();

jQuery(function() {	
	ChartObj.BaseData();
	//console.log(dataChar);
});

function queryParams(dataName,dataChar) {
	  var temp = {
		  'dataName' : dataName,   
		  'dataChar' : dataChar
	  }
	  return temp;
}

ChartObj.BaseData = function(){
	$.post('../chart/findBaseData',{
		
		},function(data,status){
			if(status == "success"){
				$("#totalIncome").html(data.totalIncome);
				$("#newOrders").html(data.newOrders);
				$("#productNumber").html(data.productNumber);
				$(data.pbList).each(function(index,ele){
					dataName.push(ele.name);
					dataChar.push({name:ele.name,value:ele.value});
				});
				ChartObj.pie();
			}
		},'json');
}

ChartObj.pie = function(){
	var div = echarts.init(document.getElementById('echarts-pie-chart'));
	var option = {
		    title : {
		        text: '产品类别销售情况',
		        subtext: '产品类别销售',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:dataName
//		        	['水果蔬菜','农资农机','畜牧水产','粮油米面','农副加工']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'left',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'产品类别销售百分比',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:dataChar
//		            [
//		                {value:335, name:'水果蔬菜'},
//		                {value:310, name:'农资农机'},
//		                {value:234, name:'畜牧水产'},
//		                {value:135, name:'粮油米面'},
//		                {value:1548, name:'农副加工'}
//		                
//		            ]
		        }
		    ]
		};
	div.setOption(option);
}