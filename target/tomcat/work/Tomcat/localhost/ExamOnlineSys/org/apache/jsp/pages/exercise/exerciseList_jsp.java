/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2016-10-28 14:43:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.pages.exercise;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class exerciseList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');
      if (_jspx_meth_c_005fimport_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("<!-- block -->\n");
      out.write("\t<div class=\"block\">\n");
      out.write("\t\t<div class=\"navbar navbar-inner block-header\">\n");
      out.write("\t\t\t<div class=\"muted pull-left\">\n");
      out.write("\t\t\t\t<ul class=\"breadcrumb\">\n");
      out.write("\t\t\t\t\t<i class=\"icon-chevron-left hide-sidebar\"> <a href='#'\n");
      out.write("\t\t\t\t\t\ttitle=\"Hide Sidebar\" rel='tooltip'>&nbsp;</a></i>\n");
      out.write("\t\t\t\t\t<i class=\"icon-chevron-right show-sidebar\" style=\"display: none;\">\n");
      out.write("\t\t\t\t\t\t<a href='#' title=\"Show Sidebar\" rel='tooltip'>&nbsp;</a>\n");
      out.write("\t\t\t\t\t</i>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\">我的练习</a> <span class=\"divider\">/</span></li>\n");
      out.write("\t\t\t\t\t<li class=\"active\">练习管理</li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"row-fluid\">\n");
      out.write("\t\t\t<div class=\"block\" style=\"border: 0px;\">\n");
      out.write("\t\t\t\t<div class=\"block-content collapse in\">\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-tabs\">\n");
      out.write("\t\t\t\t\t\t<li class=\"active\"><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/exercise/addExercise\">练习列表</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/exercise/addExerciseInfo\">练习添加</a></li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<!-- 删除用户提示 -->\n");
      out.write("\t\t\t\t\t<div class=\"span12\">\n");
      out.write("\t\t\t\t\t\t<div class=\"alert alert-success\"\n");
      out.write("\t\t\t\t\t\t\tstyle=\"margin-right: 8%;display: none; text-align: center;\" id=\"successmessage\">\n");
      out.write("\t\t\t\t\t\t\t<button class=\"close\" onclick=\"$('#successmessage').hide();\">&times;</button>\n");
      out.write("\t\t\t\t\t\t\t<strong><span id=\"messagess\"></span></strong>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"alert alert-error\"\n");
      out.write("\t\t\t\t\t\t\tstyle=\"margin-right: 8%;display: none; text-align: center;\" id=\"errormessage\">\n");
      out.write("\t\t\t\t\t\t\t<button class=\"close\" onclick=\"$('#errormessage').hide();\">&times;</button>\n");
      out.write("\t\t\t\t\t\t\t<strong><span id=\"messageee\"></span></strong>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<form action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/exercise/exportSubject\" method=\"post\" id=\"subform\">\n");
      out.write("\t\t\t\t\t\t<div class=\"span12\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"span4\">\n");
      out.write("\t\t\t\t\t\t\t\t<label class=\"control-label\" for=\"name\">练习名称：<input\n");
      out.write("\t\t\t\t\t\t\t\t\tclass=\"input-medium focused\" id=\"name\" name=\"name\"\n");
      out.write("\t\t\t\t\t\t\t\t\ttype=\"text\" /></label> \n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t<div class=\"span4 text-right\" >\n");
      out.write("\t\t\t\t\t\t<button class=\"btn btn-medium btn-primary\" type=\"button\"\n");
      out.write("\t\t\t\t\t\t\tid=\"query\">查询</button>\n");
      out.write("<!-- \t\t\t\t\t\t<button class=\"btn btn-medium btn-primary\" type=\"button\" -->\n");
      out.write("<!-- \t\t\t\t\t\t\tid=\"export\">导出</button> -->\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"subpages\" name=\"subpages\" /><input\n");
      out.write("\t\t\t\t\t\t\ttype=\"hidden\" id=\"subrp\" name=\"subrp\" />\n");
      out.write("\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<table id=\"userList\" class=\"table table-striped table-bordered\">\n");
      out.write("\t\t\t\t\t\t<thead>\n");
      out.write("\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t<th>练习名称</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>科目</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>题库</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>试题总数</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>已完成总数</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>是否启用</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>操作</th>\n");
      out.write("\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t</thead>\n");
      out.write("\t\t\t\t\t\t<tbody>\n");
      out.write("\t\t\t\t\t\t</tbody>\n");
      out.write("\t\t\t\t\t\t<!-- tbody是必须的 -->\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("function edit(ids) {\n");
      out.write("\tlocation.href = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/exercise/addExerciseInfo?id=\" + ids;\n");
      out.write("}\n");
      out.write("\n");
      out.write("function del(ids) {\n");
      out.write("\tif (confirm(\"确定要删除该科目？\")) {\n");
      out.write("\t\t$.ajax({\n");
      out.write("\t\t\ttype : 'post',\n");
      out.write("\t\t\turl : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/exercise/delExercise?id=' + ids,\n");
      out.write("\t\t\tcache : false,\n");
      out.write("\t\t\tdataType : 'json',\n");
      out.write("\t\t\tsuccess : function(data) {\n");
      out.write("\t\t\t\tif (data.result == 1) {\n");
      out.write("\t\t\t\t\t$(\"#successmessage\").hide();\n");
      out.write("\t\t\t\t\t$(\"#errormessage\").show();\n");
      out.write("\t\t\t\t\t$(\"#messageee\").text(\"删除失败，请联系管理员！\");\n");
      out.write("\t\t\t\t} else {\n");
      out.write("\t\t\t\t\t$(\"#errormessage\").hide();\n");
      out.write("\t\t\t\t\t$(\"#successmessage\").show();\n");
      out.write("\t\t\t\t\t$(\"#messagess\").text(\"删除成功！\");\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\treshcg();\n");
      out.write("\t\t\t}\n");
      out.write("\t\t});\n");
      out.write("\t}\n");
      out.write("}\n");
      out.write("\t$(document).ready(function() {\n");
      out.write("\t\toTable = $('#userList').initDT({\n");
      out.write("\t\t\tserverSide : true,\n");
      out.write("\t\t\t\"sAjaxSource\" : \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/exercise/getExerciselist\"\n");
      out.write("\t\t});\n");
      out.write("\n");
      out.write("\t\t$(\"#query\").click(function() {\n");
      out.write("\t\t\treshcg();\n");
      out.write("\t\t});\n");
      out.write("\t\t$(\"#export\").click(function() {\n");
      out.write("\t\t\t$(\"#subpages\").val(oTable.getCurrentPage());\n");
      out.write("\t\t\t$(\"#subrp\").val(oTable.getPageSize());\n");
      out.write("\t\t\t$(\"#subform\").submit();\n");
      out.write("\t\t});\n");
      out.write("\n");
      out.write("\t});\n");
      out.write("\tfunction reshcg() {\n");
      out.write("\t\tvar name = $('#name').val();\n");
      out.write("\t\tvar code = $('#code').val();\n");
      out.write("\t\tvar oSettings = [ {\n");
      out.write("\t\t\t\"name\" : \"name\",\n");
      out.write("\t\t\t\"value\" : name\n");
      out.write("\t\t}, {\n");
      out.write("\t\t\t\"name\" : \"code\",\n");
      out.write("\t\t\t\"value\" : code\n");
      out.write("\t\t} ];\n");
      out.write("\t\toTable.gridSearch(this, oSettings);\n");
      out.write("\t}\n");
      out.write("</script>\n");
      if (_jspx_meth_c_005fimport_005f1(_jspx_page_context))
        return;
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fimport_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f0 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_005fimport_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fimport_005f0.setParent(null);
    // /pages/exercise/exerciseList.jsp(4,0) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fimport_005f0.setUrl("/pages/include/pageNavigation.jsp");
    int[] _jspx_push_body_count_c_005fimport_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fimport_005f0 = _jspx_th_c_005fimport_005f0.doStartTag();
      if (_jspx_th_c_005fimport_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fimport_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fimport_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fimport_005f0.doFinally();
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f0);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fimport_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f1 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_005fimport_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fimport_005f1.setParent(null);
    // /pages/exercise/exerciseList.jsp(137,0) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fimport_005f1.setUrl("/pages/include/pageFoot.jsp");
    int[] _jspx_push_body_count_c_005fimport_005f1 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fimport_005f1 = _jspx_th_c_005fimport_005f1.doStartTag();
      if (_jspx_th_c_005fimport_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fimport_005f1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fimport_005f1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fimport_005f1.doFinally();
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f1);
    }
    return false;
  }
}
