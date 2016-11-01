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
					<li class="active">考试成绩按部门统计</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="＃">考试成绩按部门统计</a></li>
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
                {department: '技术部', qualified: 35,noqualified:5,excellent:15},
                {department: '销售部', qualified: 20,noqualified:20,excellent:8},
                {department: '管理部', qualified: 30,noqualified:10,excellent:21},
                {department: '配件部', qualified: 25,noqualified:15,excellent:17},
                {department: '办公室', qualified: 36,noqualified:5,excellent:23},
                {department: '库管部', qualified: 23,noqualified:17,excellent:13},
                {department: '职能部', qualified: 12,noqualified:18,excellent:3},
                {department: '操作部', qualified: 39,noqualified:1,excellent:28},
                {department: '其它部', qualified: 29,noqualified:11,excellent:11}
            ],
            xkey: 'department',
            ykeys: ['qualified','noqualified','excellent'],
            labels: ['及格','不及格','优秀'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ["#3d88ba",'#f56954','#00a65a']
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