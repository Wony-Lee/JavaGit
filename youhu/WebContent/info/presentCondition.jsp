<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="/top.jsp" />

<div class="text-left p-3 ">
	<div class="row" style="margin-bottom:18px">
		<div class="col-md-12" >
			<h1>유기동물 현황</h1>
		</div>
	</div>
	
	<div class="btn-group "  style="margin-bottom:18px">
		<select name="findType" id="findType" class="form-control m-2" >
			<option value="">::종류별::</option>
			<option value="dog">개</option>
			<option value="cat">고양이</option>
			<option value="etc">기타</option>
		</select>
	</div>
	
	<form class="container">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" href="#2019">2019</a></li>
			<li class="nav-item"><a class="nav-link" href="#2018">2018</a></li>
			<li class="nav-item"><a class="nav-link" href="#2017">2017</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content border mb-3">
			<div id="nine" class="container tab-pane active"><br>
<style>
	#chartdiv1 {
		width: 100%;
		height: 500px;
	}
	#chartdiv2 {
		width: 100%;
		height: 500px;
	}
</style>

		<!-- Resources -->
		<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
		<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
		<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

		<!-- Chart code -->
		<script>
			am4core.ready(function() {// Themes begin
			am4core.useTheme(am4themes_animated);// Themes end

			var chart = am4core.create("chartdiv2",am4charts.PieChart3D);
			chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
								
								var title = chart.titles.push(new am4core.Label());
								title.text = "종류별 유기동물 현황";
								title.fontSize = 25;
								title.marginBottom = 15;
								
								chart.data = [ {
									state: "인도(주인)",
									litres : 100
								}, {
									state : "입양분양",
									litres : 301.9
								}, {
									state : "폐사안락사",
									litres : 201.1
								}, {
									state : "계류기증",
									litres : 165.8
								} ];

								chart.innerRadius = am4core.percent(40);
								chart.depth = 120;

								chart.legend = new am4charts.Legend();

								var series = chart.series
										.push(new am4charts.PieSeries3D());
								series.dataFields.value = "litres";
								series.dataFields.depthValue = "litres";
								series.dataFields.category = "state";
								series.slices.template.cornerRadius = 5;
								series.colors.step = 3;
								//-------------------------------------------------------
								var chart1 = am4core.create("chartdiv1",am4charts.XYChart);
								chart1.scrollbarX = new am4core.Scrollbar();
								var title1 = chart.titles.push(new am4core.Label());
								title1.text = "지역별 유기동물 현황";
								title1.fontSize = 25;
								title1.marginBottom = 15;
								// Add data
								
								chart1.data = [ {
									
									"gu" : f ,
									"value" :123 
									
								}];

								// Create axes
								var categoryAxis = chart1.xAxes
										.push(new am4charts.CategoryAxis());
								categoryAxis.dataFields.category = "state";
								categoryAxis.renderer.grid.template.location = 0;
								categoryAxis.renderer.minGridDistance = 30;
								categoryAxis.renderer.labels.template.horizontalCenter = "right";
								categoryAxis.renderer.labels.template.verticalCenter = "middle";
								categoryAxis.renderer.labels.template.rotation = 270;
								categoryAxis.tooltip.disabled = true;
								categoryAxis.renderer.minHeight = 110;

								var valueAxis = chart1.yAxes.push(new am4charts.ValueAxis());
								valueAxis.renderer.minWidth = 50;

								// Create series
								var series1 = chart1.series.push(new am4charts.ColumnSeries());
								series1.sequencedInterpolation = true;
								series1.dataFields.valueY = "visits";
								series1.dataFields.categoryX = "state";
								series1.tooltipText = "[{categoryX}: bold]{valueY}[/]";
								series1.columns.template.strokeWidth = 0;

								series1.tooltip.pointerOrientation = "vertical";

								series1.columns.template.column.cornerRadiusTopLeft = 10;
								series1.columns.template.column.cornerRadiusTopRight = 10;
								series1.columns.template.column.fillOpacity = 0.8;

								// on hover, make corner radiuses bigger
								var hoverState = series1.columns.template.column.states
										.create("hover");
								hoverState.properties.cornerRadiusTopLeft = 0;
								hoverState.properties.cornerRadiusTopRight = 0;
								hoverState.properties.fillOpacity = 1;

								series1.columns.template.adapter
										.add(
												"fill",
												function(fill, target) {
													return chart1.colors
															.getIndex(target.dataItem.index);
												});

								// Cursor
								chart1.cursor = new am4charts.XYCursor();

							});
					// end am4core.ready()
				</script>

				<!-- HTML -->
				<div id="chartdiv1"></div>
				<div id="chartdiv2"></div>
			</div>
			
			<div id="eight" class="container tab-pane fade">
				<br>
				<h3>Menu 1</h3>
				<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<div id="seven" class="container tab-pane fade">
				<br>
				<h3>Menu 2</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			</div>
		</div>
</div>

<script>
	$(document).ready(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});		
	});
</script>
</form>

<jsp:include page="/foot.jsp" />