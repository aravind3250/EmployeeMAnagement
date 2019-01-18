<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
<script src="${pageContext.request.contextPath}/resourcefile/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resourcefile/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/Menu.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/body.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">

$(document).ready(function() {
	$("#analitics").addClass("active")

});

		$(document).ready(function() {
			var dataArrayFinal;
			$.get("list",function(data, status) {
				Highcharts.chart('container',{
				chart : {
							plotBackgroundColor : true,
							plotBorderWidth : false,
							plotShadow : false,
							height : 390,
							type : 'pie'
						},
				title : {
							text : '<b>Department wise Employee wise salary chart</b>'
						},
			    credits : {
							enabled : false
						},
				tooltip : {
							pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
						},
				exporting: 
						{ 
							enabled: false 
						},
				plotOptions : {
							pie : {
							size:150,
							allowPointSelect : true,
							cursor : 'pointer',
							dataLabels : {
										enabled : true,
										format : '<b>{point.name}</b>: {point.percentage:.1f} %',
										style : {
													color : (Highcharts.theme && Highcharts.theme.contrastTextColor)|| 'black'
												}
										}
								  }
							},
				series : [ {
							name : 'Department',
							colorByPoint : true,
							data : JSON.parse(data)
						} ]
				});
		});
});

		$(document).ready(function() {
				var dataArrayFinal;
							$.get("list1",function(data, status) {
								var arr = JSON.parse(data);
								console.log(arr)
								keys = [];
								for (var i = 0; i < arr.length; i++) {
									keys.push(arr[i].name);
									}

								Highcharts.chart('container1',{
									chart : {
												height : 370,
												type : 'column'
											},
									title : {
												text : '<b>Department wise Number of Skills chart'
											},
									credits : {
												enabled : false
											},
									xAxis : {
												categories : keys
											},
									tooltip : {
												pointFormat : '{series.name}: <b>{point.y}</b>'
												},
									exporting: { 
												enabled: false 
											},
									plotOptions : {
										pie : {
											allowPointSelect : true,
											cursor : 'pointer',
											dataLabels : {
												enabled : true,
												format : '<b>{point.name}</b>: {point.y} %',
												style : {
													color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
															|| 'black'
												}
											}
										}
									},
									series : [ {
										name : "skills",
										colorByPoint : true,
										data : JSON
												.parse(data)
									} ]
								});
							});
						})

		$(document).ready(function() {
							$.get("list2",function(data) {
								console.log(data)
								var arr = JSON.parse(data);
								console.log(arr)
								categories = [];
								skills = []
								series = []
								for (var i = 0; i < arr.length; i++) {
									categories.push(arr[i].name);
									var keys = Object.keys(arr[i].y)
									for (var j = 0; j < keys.length; j++) {
										if (skills.indexOf(keys[j]) == -1) {
											skills.push(keys[j])
											}
										}
								}

								console.log('Sir')
								for (var k = 0; k < skills.length; k++) {
									var obj = new Object();
									obj.name = skills[k];
									obj.data = []
									for (var i = 0; i < arr.length; i++)
										obj.data.push(0)
										series.push(obj)
								}

								console.log(series)
								for (var i = 0; i < arr.length; i++) {
									var keys = Object.keys(arr[i].y);
									var values = Object.values(arr[i].y);
										for (var l = 0; l < keys.length; l++) {
											for (var m = 0; m < series.length; m++) {
												var ser = series[m]
												if (ser.name === keys[l]) {
													ser.data[i] = values[l];
												}
											}
										}
									}
								console.log(series)
									Highcharts.chart('container2',
									{
										chart : {
													height : 370,
													type : 'column'
												},
										credits : {
													enabled : false
												},
										title : {
													text : '<b>Department wise Skills View</b>'
												},
										xAxis : {
													categories : categories
												},
										yAxis : {
													min : 0,
												title : {
															text : 'Total skilss department wise'
														}
												},
										tooltip : {
													pointFormat : '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
													shared : true
												},
									    exporting: { 
													enabled: false 
												},
										plotOptions : {
													column : {
													stacking : 'percent'
													}
												},
										series : series
									});

							  });
						});
	</script>
<body>
	<%@ include file="header.jsp"%><br>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6"
				style="height: 400px; border: 1px solid #999999; width: 45%">
				<div id="container"
					style="position: absolute; cursor: pointer; margin-top: 0px; hight: 10px; width: 95%;"></div>
			</div>
			<div class="col-lg-6"
				style="height: 400px; border: 1px solid #999999; width: 45%">
				<h1 class="Analyticsh1"style="font-size: 20px; margin-top: 35px;">
					<b>Department Wise Employees and Salary - Tabular View</b>
				</h1>
				<table id="dep">
					<thead>
						<tr>
							<th>Department</th>
							<th>Total Employees</th>
							<th>Total Salary</th>
							<th>Average Salary</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${depempsal}" var="e">
							<tr>
								<td>${e.depname}</td>
								<td style="text-align: right;">${e.employeeid}</td>
								<td style="text-align: right;">${e.salary}</td>
								<td style="text-align: right;">${e.averageSalary}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6"
				style="height: 400px; border: 1px solid #999999; width: 45%">
				<div id="container1"
					style="position: absolute; cursor: pointer; margin-top: 25px; margin-left: 15px; width: 90%;">
				</div>
			</div>
			<div class="col-lg-6"
				style="height: 400px; border: 1px solid #999999; width: 45%">
				<div id="container2"
					style="position: absolute; cursor: pointer; margin-top: 25px; margin-left: 15px; width: 90%;"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-sm-4" style="border-width: 2x;">
			<div id="container1"
				style="position: absolute; cursor: pointer; width: 41%; z-index: -10; margin-top: 20%; margin-left: 1%;"></div>
		</div>
		<div class="col-sm-4" style="border-width: 2x;"></div>
	</div>
</body>
</html>