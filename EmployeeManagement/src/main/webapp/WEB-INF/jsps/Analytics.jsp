<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#dep {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width:100%;
	margin-top: 5%;
}

#dep td, #dep th {
	border: 1px solid #ddd;
	padding: 8px;
}

#dep tr:nth-child(even) {
	background-color: #f2f2f2;
}

#dep tr:hover {
	background-color: #ddd;
}

#dep th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #3399ff;
	color: white;
}

.col-lg-6{
	hight:500px;
	width:46%;
	margin-left:30px;
	margin-right:20px;;
	margin-top:50px;
	margin-bottom:60px;
	border-color:


}
h1{
	text-align: center;
	font-size: 15px;
	font-family: sans-serif;	
	font-style: normal;
	font-weight: 300;
	

}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2>this is analytics page</h2>

	<div class="container-fluid">
			<div class="row">
			<div class="col-lg-6" style="height: 500px; border: 1px solid black">
				<div id="container"style="position: absolute; cursor: pointer; z-index: -10;margin-top:25px;margin-left:-5px;"></div>
			</div>
			<div class="col-lg-6" style="height:500px; border:1px solid black">
				<h1><b>Department Wise Employees & Salary - Tabular View</b></h1>
					<table id="dep" >
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
									<td>${e.department}</td>
									<td style="text-align: right;">${e.employeeid}</td>
									<td style="text-align: right;">${e.salary}</td>
									<td style="text-align: right;">${e.avgsalary}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-lg-6" style="height:300px; border:2px solid black">.col-sm-4</div>
				<div class="col-lg-6" style="height:300px; border:2px solid black">.col-sm-4</div>
			</div>
	</div>

<!-- 
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4" style="border-width: 10x; border-color:black; margin-left: ">
				
			</div>
			<div class="col-sm-4" style="border-width: 2x;">
				<div id="container"style="position: absolute; cursor: pointer; width: 40%; z-index: -10; margin-top: -18%; margin-left: 2%;"></div>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4" style="border-width: 2x;">
				<div id="container1"style="position: absolute; cursor: pointer; width: 41%; z-index: -10; margin-top: 20%; margin-left: 1%;"></div>
			</div>
			<div class="col-sm-4" style="border-width: 2x;">
				<div class="c" id="container2"
					style="position: absolute; cursor: pointer; width: 41%; z-index: -10; margin-top: 20%; margin-left: 54%;"></div>
			</div>
		</div>
	</div> -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			var dataArrayFinal;
			$.get("list",function(data, status) {
					Highcharts.chart(
									'container',
									{
										chart : {

											plotBackgroundColor : true,
											plotBorderWidth : true,

											plotShadow : true,
											type : 'pie'
										},
										title : {
											text : 'Department wise Employee wise salary chart'
										},
										tooltip : {
											pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
										},
										plotOptions : {
											pie : {
												allowPointSelect : true,
												cursor : 'pointer',
												dataLabels : {
													enabled : true,
													format : '<b>{point.name}</b>: {point.percentage:.1f} %',
													style : {
														color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
																|| 'black'
													}
												}
											}
										},
										series : [ {
											name : 'Department',
											colorByPoint : true,
											data : JSON
													.parse(data)
										} ]
									});
							});
			})

		$(document).ready(function() {
			var dataArrayFinal;
			$.get("list1",function(data, status) {
				Highcharts.chart('container1',{
									chart : {
										type : 'column'
									},
									title : {
										text : 'Department wise Employee wise salary chart'
									},
									tooltip : {
										pointFormat : '{series.name}: <b>{point.y}</b>'
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
						categories
								.push(arr[i].name);

						var keys = Object
								.keys(arr[i].y)

						for (var j = 0; j < keys.length; j++) {

							if (skills
									.indexOf(keys[j]) == -1) {
								skills
										.push(keys[j])
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

						var keys = Object
								.keys(arr[i].y);
						var values = Object
								.values(arr[i].y);

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

					Highcharts
							.chart(
									'container2',
									{
										chart : {
											type : 'column'
										},
										title : {
											text : 'Stacked column chart'
										},
										xAxis : {
											categories : categories
										},
										yAxis : {
											min : 0,
											title : {
												text : 'Total fruit consumption'
											}
										},
										tooltip : {
											pointFormat : '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
											shared : true
										},
										plotOptions : {
											column : {
												stacking : 'percent'
											}
										},
										series : series
									/*[
										{
									    name: 'Java',
									    data: [4, 3, 1]
									    }
										, 
									    {
									        name: 'Hib',
									        data: [2, 2, 2]
									    }
										,
									    {
									        name: 'Struts',
									        data: [1, 1,1]
									    }, 
									    {
									        name: 'Spring',
									        data: [4, 0,2]
										}
									]
									 */
									});

							});
						});
	</script>
</body>
</html>