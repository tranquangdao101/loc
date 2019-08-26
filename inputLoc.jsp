<%@page import="org.w3c.dom.Document"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="dao.ThanhVienDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.7.1/modernizr.min.js"></script>

<script>

// Safari reports success of list attribute, so doing ghetto detection instead
yepnope({
  test : (!Modernizr.input.list || (parseInt($.browser.version) > 400)),
  yep : [
      'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/jquery.relevant-dropdown.js',
      'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/load-fallbacks.js'
  ]
});
</script>
</head>
<body>
<input type="text" list="ho" id="fname" name="hothanhvien" onchange="xuLyLocTheoHo()"/>
<%Set<String> hoThanhVien = new ThanhVienDAO().getHo(); %>
<datalist id="ho">
<%for(String  a: hoThanhVien ){ %>
	<option value="<%=a.toLowerCase().trim()%>"><%=a %></option>
	<%} %>
</datalist>
</body>
<script type="text/javascript" >
	function xuLyLocTheoHo(){
		var ho = document.getElementById("fname").value;
          window.location.href = 'XuLyLocTheoHo?ho=' + document.getElementById('fname').value;
	}
</script>
</html>