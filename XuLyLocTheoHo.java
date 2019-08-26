package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ThanhVienDAO;
import model.MyConnectDB;
import model.ThanhVien;

@WebServlet("/XuLyLocTheoHo")
public class XuLyLocTheoHo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XuLyLocTheoHo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ho = request.getParameter("ho");
		
		ArrayList<ThanhVien> listThanhVien=new ArrayList<>();
		try {
			if(ho.equals("")||ho==null){
				HttpSession session = request.getSession();
				session.setAttribute("allThanhVien", new ThanhVienDAO().getAllThanhVien());
			}else{
			ResultSet rs = new MyConnectDB().chonDuLieuTuDTB("select * from ThanhVien where ho='"+ho+"'");
			while(rs.next()){
				listThanhVien.add(new ThanhVien(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			HttpSession session = request.getSession();
			session.setAttribute("dsThanhVien", listThanhVien);
			response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
