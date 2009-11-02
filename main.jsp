<%@page contentType="text/html; charset=utf-8"%>
<%@page errorPage="/error.jsp"%>
<%@page import="java.io.File" %>
<%@taglib uri="/WEB-INF/cruisecontrol-jsp11.tld" prefix="cruisecontrol"%>
<%
    String rmiPort = System.getProperty("cruisecontrol.rmiport");
    boolean rmiEnabled = rmiPort != null;

    String ccname  = System.getProperty("ccname", "");
    String project = request.getPathInfo().substring(1);

    boolean apidoc   = false;
    boolean coverage = false;
%>
<cruisecontrol:artifactsLink>
<% 
    String log = new File(application.getInitParameter("logDir")).getAbsolutePath();
    String ts  = artifacts_url.substring(artifacts_url.lastIndexOf('/') + 1);

    File artifacts = new File(log + "/" + project + "/" + ts);

    if (!artifacts.exists()) {
        artifacts = new File(log + "/../artifacts/" + project + "/" + ts);
    }

    apidoc   = new File(artifacts.getAbsolutePath() + "/api").exists();
    coverage = new File(artifacts.getAbsolutePath() + "/coverage").exists();
%>
</cruisecontrol:artifactsLink>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title><%= ccname%> phpUnderControl 0.4.2 - Build Results</title>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
    <link type="text/css" rel="stylesheet" href="css/SyntaxHighlighter.css"/>
    <link type="text/css" rel="stylesheet" href="css/php-under-control.css?v=2"/>
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <link type="application/rss+xml" rel="alternate" href="<%= request.getContextPath() %>/rss/<%= project %>" title="RSS"/>
  </head>
  <body>
    <div id="container">
      <%@ include file="header.jsp" %>
      <cruisecontrol:tabsheet>
        <tr>
          <td>
          
            <%-- phpUnderControl 1 --%>
          
            <cruisecontrol:tab name="buildResults" label="Overview" >
              <%@ include file="buildresults.jsp" %>
            </cruisecontrol:tab>
            
            <%-- phpUnderControl 2 --%>
            
            <cruisecontrol:tab name="testResults" label="Tests" >
              <%@ include file="phpunit.jsp" %>
            </cruisecontrol:tab>
            
            <%-- phpUnderControl 3 --%>

            <cruisecontrol:tab name="metrics" label="Metrics" >
              <%@ include file="metrics.jsp" %>
            </cruisecontrol:tab>
            
            <%-- phpUnderControl 4 --%>
              
            <% if (coverage) { %>
            <cruisecontrol:tab name="coverage" label="Coverage">
              <cruisecontrol:artifactsLink>
                <iframe src="<%= artifacts_url %>/coverage/index.html" class="tab-content">
                </iframe>
              </cruisecontrol:artifactsLink>
            </cruisecontrol:tab>
            <% } %>
            
            <%-- phpUnderControl 5 --%>
              
            <% if (apidoc) { %>
            <cruisecontrol:tab name="documentation" label="Documentation">
              <cruisecontrol:artifactsLink>
                <iframe src="<%= artifacts_url %>/api/index.html" class="tab-content">
                </iframe>
              </cruisecontrol:artifactsLink>
            </cruisecontrol:tab>
            <% } %>
            
            <%-- phpUnderControl 6 --%>

            <cruisecontrol:tab name="phpcs" label="CodeSniffer">
              <%@ include file="phpcs.jsp" %>
            </cruisecontrol:tab>
            
            <%-- phpUnderControl 7 --%>
              
            <cruisecontrol:tab name="pmd" label="PHPUnit PMD">
              <%@ include file="phpunit-pmd.jsp" %>
            </cruisecontrol:tab>
            
            <%-- phpUnderControl 8 --%>

            <cruisecontrol:tab name="simpletest" label="SimpleTest">
              <%@ include file="cakephp-simpletest.jsp" %>
            </cruisecontrol:tab>
            
            <%-- phpUnderControl 9 --%>
          </td>
        </tr>
      </cruisecontrol:tabsheet>
    </div>
    <%@ include file="footer.jsp" %>
    <script type="text/javascript" src="js/prototype.js?v=1"></script>
    <script type="text/javascript" src="js/php-under-control.js?v=1"></script>
  </body>
</html>
