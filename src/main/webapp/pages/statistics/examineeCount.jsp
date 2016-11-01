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
					<li class="active">考试成绩统计</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="＃">考试成绩统计</a></li>
					</ul>
					<div class="block-content collapse in">
					 <div class="span12">
                              <div id="hero-graph" style="height: 230px;"></div>
                      </div>
				    </div>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		// Morris Line Chart
		var tax_data = [ {
			"period" : "2016-01",
			"scroes" : 68
		}, {
			"period" : "2016-02",
			"scroes" : 73
			
		}, {
			"period" : "2016-03",
			"scroes" : 86
			
		}, {
			"period" : "2016-04",
			"scroes" : 90
			
		}, {
			"period" : "2016-05",
			"scroes" : 62
			
		}, {
			"period" : "2016-06",
			"scroes" : 89
			
		}, {
			"period" : "2016-07",
			"scroes" : 96
			
		}, {
			"period" : "2016-08",
			"scroes" : 87
			
		} ];
		Morris.Line({
			element : 'hero-graph',
			data : tax_data,
			xkey : 'period',
			xLabels : "month",
			ykeys : [ 'scroes'],
			labels : [ '分数']
		});

	});
</script>
<c:import url="/pages/include/pageFoot.jsp" />