package dao;

public interface ObjectDAO {
		public boolean add(Object obj);
		public boolean edit(Object obj,String id);
		public boolean delete(String id);
}
