<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/pages/include/pageNavigation.jsp" />
	<div style=" margin-left: 10%; margin-right: 10%" class="row">
		<div class=".col-xs-12 .col-sm-12 .col-md-12 .col-lg-12">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">
					考试<small>统计图</small>
					</div>
				</div>
				<div class="block-content collapse in">
					 <div class="span12">
                              <div id="hero-bar" style="height: 230px;"></div>
                      </div>
				</div>
			</div>
			<!-- /block -->
		</div>
	</div>
	<div class="row" style="margin-left: 10%; margin-right: 10%">
		<div class="pull-left" style="width: 30%">

			<div class="col-md-4">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">快捷入口</div>
					</div>
					<div class="block-content collapse in">
						<table width="100%" border="0">
							<tr height="100px">
								<td width="33%"><div align="center">
										<a href="../item/add"><img alt=""
											src="../static/img/tkgl.png" width="40px" style="margin-bottom: 4px;" class="img-rounded"></a>
										<br/>题库管理
									</div></td>
								<td width="33%"><div align="center">
										<a href="../questions/add">
										<img alt="" src="../static/img/stgl.png" width="40px" style="margin-bottom: 4px;" class="img-rounded"></a>
										<br/>试题管理
									</div></td>
								<td width="33%"><div align="center"></div></td>
							</tr>
							<tr height="100px">
								<td width="33%"><div align="center"></div></td>
								<td width="33%"><div align="center"></div></td>
								<td width="33%"><div align="center"></div></td>
							</tr>
						</table>

					</div>
				</div>
				<!-- /block -->
			</div>
		</div>
		<div class="pull-left" style="margin-left: 3%; width: 67%">

			<div class="col-md-9">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">正在监考中</div>
						<div class="muted pull-right"><a href="${basepath}/invigilate/add">更多..</a></div>
					</div>
					<div class="block-content collapse in">
							<table class="table table-bordered">
								<c:forEach items="${examList}" var="exam">
									<tr style="height:42px !important;">
										<td width="50%">${exam.name }</td>
										<td  width="30%">${exam.duration}分钟</td>
										<td  width="20%"><a href="${basepath}/invigilate/add">开始监考</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
				</div>
				<!-- /block -->
			</div>
		</div>
	</div>


	<!-- block -->
	<script type="text/javascript">
		$(function() {
			$(".flagbtn").click(function(){
				var id=this.id;
				var url="${basepath}/bbs/updateis_check";
				$.ajax({
					type : 'post',
					url : url,
					data : {
						id : id
					},
					cache : false,
					dataType : 'json',
					success : function(data) {
						$("#"+id).hide();
					},
					error : function() {
					}
				});
			});
			$(".img-rounded").mouseover(function(){
				$(this).addClass("hoverimg");
			});
			$(".img-rounded").mouseout(function(){
				$(this).removeClass("hoverimg");
			});
			
			
			// Morris Bar Chart
	        Morris.Bar({
	            element: 'hero-bar',
	            data: [
	                {department: '2016年01月考', average: 62.5},
	                {department: '2016年02月考', average: 71},
	                {department: '2016年03月考', average: 58.5},
	                {department: '2016年04月考', average: 80},
	                {department: '2016年05月考', average: 64},
	                {department: '2016年06月考', average: 72},
	                {department: '2016年07月考', average: 53},
	                {department: '2016年08月考', average: 91},
	                {department: '2016年09月考', average: 78},
	                {department: '2016年10月考', average: 65}
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
				
			}, {
				"period" : "2016-09",
				"qualified" : 6,
				"noqualified" : 10,
				"excellent" : 24
				
			}, {
				"period" : "2016-10",
				"qualified" : 6,
				"noqualified" : 14,
				"excellent" : 22
				
			}];
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