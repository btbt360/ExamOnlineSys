/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2016-10-01 14:20:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.pages.sys;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class myEditPass_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
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
      out.write("\t<div class=\"block\" >\n");
      out.write("\t\t<div class=\"navbar navbar-inner block-header\">\n");
      out.write("\t\t\t<div class=\"muted pull-left\">\n");
      out.write("\t\t\t\t<ul class=\"breadcrumb\">\n");
      out.write("\t\t\t\t\t<i class=\"icon-chevron-left hide-sidebar\"><a href='#' title=\"Hide Sidebar\" rel='tooltip'>&nbsp;</a></i>\n");
      out.write("\t\t\t\t\t<i class=\"icon-chevron-right show-sidebar\" style=\"display: none;\"><a href='#' title=\"Show Sidebar\" rel='tooltip'>&nbsp;</a></i>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\">我的面板</a> <span class=\"divider\">/</span></li>\n");
      out.write("\t\t\t\t\t<li class=\"active\">密码修改</li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"block-content collapse in\">\n");
      out.write("\t\t\t<div class=\"span12\">\n");
      out.write("\t\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\t\t\t\t<form class=\"form-horizontal\" action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/user/updatepass\" method=\"post\" id=\"commentForm\">\n");
      out.write("\t\t\t\t\t<fieldset>\n");
      out.write("\t\t\t\t\t\t<legend>密码信息维护</legend>\n");
      out.write("\t\t\t\t\t\t<div class=\"control-group\">\n");
      out.write("\t\t\t\t\t\t\t<label class=\"control-label\" for=\"oldpassword\">原始密码：</label>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"controls\">\n");
      out.write("\t\t\t\t\t\t\t<input name=\"user.id\" type=\"hidden\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userToken.vuser.user.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" >\n");
      out.write("\t\t\t\t\t\t\t\t<input class=\"input-xlarge focused\" id=\"oldpassword\" name=\"oldpassword\"\n");
      out.write("\t\t\t\t\t\t\t\t\ttype=\"password\" placeholder=\"请输入您的原始密码！\" ><span class=\"help-inline\" id=\"oldline\" style=\"color: red;\"></span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"control-group\">\n");
      out.write("\t\t\t\t\t\t\t<label class=\"control-label\" for=\"\">新密码：</label>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"controls\">\n");
      out.write("\t\t\t\t\t\t\t\t<input class=\"input-xlarge focused\" id=\"password\" name=\"user.password\"\n");
      out.write("\t\t\t\t\t\t\t\t\ttype=\"password\" placeholder=\"请输入您的新密码！\"  ><span class=\"help-inline\" id=\"newpass\" style=\"color: red;\"></span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"control-group\">\n");
      out.write("\t\t\t\t\t\t\t<label class=\"control-label\" for=\"email\">重复密码：</label>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"controls\">\n");
      out.write("\t\t\t\t\t\t\t\t<input class=\"input-xlarge focused\" id=\"cfpassword\" name=\"cfpassword\"\n");
      out.write("\t\t\t\t\t\t\t\t\ttype=\"password\" placeholder=\"请重复输入您的新密码！\"  ><span class=\"help-inline\" id=\"newline\" style=\"color: red;\"></span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"form-actions\">\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" id=\"save\">保存</button>\n");
      out.write("\t\t\t\t\t\t\t<button type=\"reset\" class=\"btn\">取消</button>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</fieldset>\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("$(document).ready(function(){\n");
      out.write("\t\n");
      out.write("\t$(\"#oldpassword\").blur(function(){\n");
      out.write("\t\tvar pass=$(\"#oldpassword\").val();\n");
      out.write("\t\t$.ajax({\n");
      out.write("\t        type: \"GET\",\n");
      out.write("\t        url: \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basepath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/user/checkpass\",\n");
      out.write("\t        data: {oldpassword:pass},\n");
      out.write("\t        dataType: \"json\",\n");
      out.write("\t        success: function(data){\n");
      out.write("\t                    if(data==1){\n");
      out.write("\t                    \t$(\"#oldline\").html(\"<font color='green'>输入正确</font>\");\n");
      out.write("\t                    }else{\n");
      out.write("\t                    \t$(\"#oldline\").html(\"<font color='red'>输入错误</font>\");\n");
      out.write("\t                    \t$(\"#oldpassword\").val('');\n");
      out.write("\t                    }\n");
      out.write("\t                 }\n");
      out.write("\t    });\n");
      out.write("\t});\n");
      out.write("\t$(\"#cfpassword\").blur(function(){\n");
      out.write("\t\tvar cfpassword = $(\"#cfpassword\").val();\n");
      out.write("\t\tvar password = $(\"#password\").val();\n");
      out.write("\t\tif(cfpassword==password){\n");
      out.write("\t\t\t$(\"#newline\").html(\"<font color='green'>重复密码输入正确</font>\");\n");
      out.write("\t\t}else{\n");
      out.write("\t\t\t$(\"#newline\").html(\"<font color='red'>重复密码输入错误</font>\");\n");
      out.write("\t\t\t$(\"#cfpassword\").val('');\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\t});\n");
      out.write("\t\n");
      out.write("\t$(\"#save\").click(function(){\n");
      out.write("\t\tvar oldpass=$(\"#oldpassword\").val();\n");
      out.write("\t\tvar cfpass = $(\"#cfpassword\").val();\n");
      out.write("\t\tvar newpass = $(\"#password\").val();\n");
      out.write("\t\t\n");
      out.write("\t\tif(oldpass ==''||oldpass ==null){\n");
      out.write("\t\t\t$(\"#oldline\").html(\"<font color='red'>请输入原密码</font>\");\n");
      out.write("\t\t\treturn false;\n");
      out.write("\t\t}\n");
      out.write("\t\tif(newpass ==''||newpass ==null){\n");
      out.write("\t\t\t$(\"#newpass\").html(\"<font color='red'>请输入新密码</font>\");\n");
      out.write("\t\t\treturn false;\n");
      out.write("\t\t}\n");
      out.write("\t\tif(cfpass ==''||cfpass ==null){\n");
      out.write("\t\t\t$(\"#newline\").html(\"<font color='red'>请重复输入新密码</font>\");\n");
      out.write("\t\t\treturn false;\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\t\t$(\"#commentForm\").submit();\n");
      out.write("\t});\n");
      out.write("});\n");
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
    // /pages/sys/myEditPass.jsp(4,0) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /pages/sys/myEditPass.jsp(18,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message!=null}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("\t\t\t\t\t\t<div class=\"alert alert-success\" style=\"margin-right: 8%;text-align: center;\">\n");
        out.write("\t\t\t\t\t\t\t\t\t\t<button class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
        out.write("\t\t\t\t\t\t\t\t\t\t<strong>保存成功！</strong>\n");
        out.write("\t\t\t\t\t\t</div>\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
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
    // /pages/sys/myEditPass.jsp(114,0) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
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
