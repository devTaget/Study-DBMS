package view;

import dao.UserDAO;

public class Test {
	public static void main(String[] args) {
		UserDAO userDAO = new UserDAO();
//		if(userDAO.checkId("hds1234")) {
//			System.out.println("��� ������ ���̵�");
//			return;
//		}
//		System.out.println("�ߺ��� ���̵�");
		
		System.out.println(userDAO.select(1L));
		
	}
}
