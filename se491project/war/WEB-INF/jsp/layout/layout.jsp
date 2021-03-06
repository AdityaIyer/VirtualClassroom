<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
html, body, .fullheight {
    height: 100%;
    width: 100%;
    margin: 0; 
    padding: 0;
  }
  
 .navigation {
    vertical-align:top;
    width: 10%;
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
<table class="fullheight" border="1" cellpadding="2" cellspacing="2" align="center">
    <tr>
        <td height="8%" colspan="2"><tiles:insertAttribute name="header" />
        </td>
    </tr>
     <tr>
        <td height="10px" colspan="2"><tiles:insertAttribute name="tabs" />
        </td>
    </tr>
    <tr>
        <td class="navigation"><tiles:insertAttribute name="navigation" /></td>
        <td align="center" ><tiles:insertAttribute name="body" /></td>
    </tr>
    <tr>
        <td height="10px" colspan="2"><tiles:insertAttribute name="footer" />
        </td>
    </tr>
</table>
</body>
</html>