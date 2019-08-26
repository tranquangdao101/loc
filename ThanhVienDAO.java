package dao;

import java.lang.reflect.Array;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Set;
import java.util.TreeSet;

import model.MyConnectDB;
import model.ThanhVien;

public class ThanhVienDAO implements ObjectDAO {

	public static ArrayList<ThanhVien> dsThanhVien = new ArrayList<>();
	public static Set<String> dsHoThanhVien = new TreeSet<>();

	public ThanhVienDAO() {
		dsThanhVien.removeAll(dsThanhVien);
	}

	public ArrayList<ThanhVien> getAllThanhVien() {
		ResultSet rs;
		try {
			rs = new MyConnectDB().chonDuLieuTuDTB("select * from ThanhVien");
			while (rs.next()) {
				String id = rs.getString(1);
				String ho = rs.getString(2);
				String ten = rs.getString(3);
				String taiKhoan = rs.getString(4);
				dsThanhVien.add(new ThanhVien(id, ho, ten, taiKhoan));
			}
			return dsThanhVien;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return null;
	}

	public Set<String> getHo() {
		ResultSet rs;
		try {
			rs = new MyConnectDB().chonDuLieuTuDTB("select * from ThanhVien");
			while (rs.next()) {
				dsHoThanhVien.add(rs.getString(2));
			}
			return dsHoThanhVien;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return dsHoThanhVien;
	}

	@Override
	public boolean add(Object obj) {
		ThanhVien tv = (ThanhVien) obj;
		try {
			new MyConnectDB().thucThiCauLenhSQL("insert into ThanhVien values('" + tv.getId() + "','" + tv.getHo()
					+ "','" + tv.getTen() + "','" + tv.getTaiKhoan() + "')");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean edit(Object obj, String id) {
		ThanhVien tv = (ThanhVien) obj;
		try {
			new MyConnectDB().thucThiCauLenhSQL("update ThanhVien set Ho='" + tv.getHo() + "',Ten='" + tv.getTen()
					+ "',TaiKhoan='" + tv.getTaiKhoan() + "'where id='" + id + "'");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean delete(String id) {
		try {
			new MyConnectDB().thucThiCauLenhSQL("delete from ThanhVien where id='" + id + "'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) {
		System.out.println(new ThanhVienDAO().dsHoThanhVien);
	}

	public static ArrayList<ThanhVien> getDsThanhVien() {
		return dsThanhVien;
	}

	public static void setDsThanhVien(ArrayList<ThanhVien> dsThanhVien) {
		ThanhVienDAO.dsThanhVien = dsThanhVien;
	}

	public static Set<String> getDsHoThanhVien() {
		return dsHoThanhVien;
	}

	public static void setDsHoThanhVien(Set<String> dsHoThanhVien) {
		ThanhVienDAO.dsHoThanhVien = dsHoThanhVien;
	}

}
