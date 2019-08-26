<%@page import="dao.ThanhVienDAO"%>
<%@page import="model.ThanhVien"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyConnectDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Demo lọc danh sách thành viên theo họ</title>
	<meta charset="utf-8">
	   <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  
    <!-- Datatables -->
    <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<h2><strong>Giới thiệu cách lọc danh sách theo một tiêu chí nào đó.</strong></h2>
			<p>Cụ thể trong bài này ,chúng ta sẽ lọc danh sách thành viên theo họ ;</p>
		</div>
		<div class="center">
			<center><label><strong>Chọn họ mà bạn muốn tìm</strong></label><jsp:include page="inputLoc.jsp"></jsp:include></center>
		</div>
		<div>
		  <table id="datatable-buttons" class="table table-striped table-bordered">
		                      <thead>
		                        <tr>
		                          <th>STT</th>
		                          <th>Họ </th>
		                          <th>Tên </th>
		                          <th>Tài khoản</th>
		                        </tr>
		                      </thead>
					<%	
					ArrayList<ThanhVien> list = (ArrayList<ThanhVien>)session.getAttribute("dsThanhVien");
								ArrayList<ThanhVien> listAll = new ThanhVienDAO().getAllThanhVien();
								if(session.getAttribute("dsThanhVien")!=null||list!=null){
									listAll=list;
								}
								%>
		                      <tbody>
		                   <%for(int i =0 ;i<listAll.size();i++){%>  
		                        <tr>
		                          <td><%=i %></td>
		                          <td><%=listAll.get(i).getHo() %></td>
		                          <td><%=listAll.get(i).getTen()%></td>
		                          <td><%=listAll.get(i).getTaiKhoan()%></td>
		                        </tr>
		                        <%} %>
		                      </tbody>
		    </table>
		    </div>
	 </div>
</body>

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    
    <!-- Datatables -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
</html>