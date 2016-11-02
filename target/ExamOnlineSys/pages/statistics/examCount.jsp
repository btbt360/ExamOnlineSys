<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/pages/include/pageNavigation.jsp" />
<!-- block -->
	<div class="block">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<ul class="breadcrumb">
					<i class="icon-chevron-left hide-sidebar"> <a href='#'
						title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
					<i class="icon-chevron-right show-sidebar" style="display: none;">
						<a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a>
					</i>
					<li><a href="#">统计分析</a> <span class="divider">/</span></li>
					<li class="active">考试统计</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="＃">考试统计</a></li>
					</ul>
					
					
					<div style="border-bottom: 1px solid #ececec;">&nbsp;</div>
					<div class="block-content collapse in">
					 <div class="span12">
                             <div id="hero-bar" style="height: 250px;"></div>
                      </div>
				    </div>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		
		
		// Morris Bar Chart
        Morris.Bar({
            element: 'hero-bar',
            data: [
                {department: '201601月考', average: 62.5},
                {department: '201602月考', average: 71},
                {department: '201603月考', average: 58.5},
                {department: '201604月考', average: 80},
                {department: '201605月考', average: 64},
                {department: '201606月考', average: 72},
                {department: '201607月考', average: 53},
                {department: '201608月考', average: 91},
                {department: '201609月考', average: 78},
                {department: '2016010月考', average: 65}
            ],
            xkey: 'department',
            ykeys: ['average'],
            labels: ['平均分'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ['#3d88ba']
        });


		
		var tax_data = [ {
			"period" : "2016-01",
			"qualified" : 15,
			"noqualified" : 5,
			"excellent" : 20
			
		}, {
			"period" : "2016-02",
			"qualified" : 10,
			"noqualified" : 5,
			"excellent" : 25
			
		}, {
			"period" : "2016-03",
			"qualified" :10,
			"noqualified" :0,
			"excellent" : 30
			
		}, {
			"period" : "2016-04",
			"qualified" : 15,
			"noqualified" : 0,
			"excellent" : 25
			
		}, {
			"period" : "2016-05",
			"qualified" : 5,
			"noqualified" : 0,
			"excellent" : 35
			
		}, {
			"period" : "2016-06",
			"qualified" : 7,
			"noqualified" : 3,
			"excellent" : 30
			
		}, {
			"period" : "2016-07",
			"qualified" : 9,
			"noqualified" : 2,
			"excellent" : 29
			
		}, {
			"period" : "2016-08",
			"qualified" : 2,
			"noqualified" : 18,
			"excellent" : 20
			
		} ];
		Morris.Line({
			element : 'hero-graph',
			data : tax_data,
			xkey : 'period',
			xLabels : "month",
			ykeys : [ 'noqualified','qualified','excellent'],
			labels : [ '不及格','及格','优秀']
		});

	});
	
</script>
<c:import url="/pages/include/pageFoot.jsp" />