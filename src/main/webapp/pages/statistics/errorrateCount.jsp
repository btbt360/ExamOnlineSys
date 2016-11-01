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
					<li class="active">试题错误率统计</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="＃">试题错误率统计</a></li>
					</ul>
					
					<form action="${basepath}/exam/exportSubject" method="post" id="subform">
						<div class="span12">
							<div class="span4">
								<label class="control-label" for="subjectid">试卷名称：
									<select class="m-wrap" id="exampapersid" name="exampapersid" placeholder="请选择试卷！">
										<option value='0'>请选择试卷</option>
										<c:forEach var="exampapers" items="${exampaperslist}">
									<option
										<c:if test="${exampapers.id==exam.exampapersId}">selected</c:if>
										value='${exampapers.id}'>${exampapers.name}</option>
								</c:forEach>
									</select>
								</label> 
							</div>
							<div class="span4 text-right" >
						    <button class="btn btn-medium btn-primary" type="button"
							id="query">查询</button>
 						<!-- <button class="btn btn-medium btn-primary" type="button" 
							id="export">计算分数</button> --> 
						</div>
						</div>
						
					</form>
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
                {department: '选择题(题号：3)', errornum: 7},
                {department: '选择题(题号：5)', errornum: 4},
                {department: '选择题(题号：9)', errornum: 5},
                {department: '选择题(题号：10)', errornum: 12},
                {department: '判断题(题号：2)', errornum: 6},
                {department: '判断题(题号：5)', errornum: 9},
                {department: '判断题(题号：7)', errornum: 15},
                {department: '填空题(题号：3)', errornum: 12},
                {department: '填空题(题号：6)', errornum: 13},
                {department: '填空题(题号：7)', errornum: 15},
                {department: '简单题(题号：1)', errornum: 24}
            ],
            xkey: 'department',
            ykeys: ['errornum'],
            labels: ['错误次数'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ['#f56954']
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