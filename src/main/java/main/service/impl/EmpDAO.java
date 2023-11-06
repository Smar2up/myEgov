package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.EmpVO;

@Repository("empDAO")
public class EmpDAO extends EgovAbstractDAO {

	public String insertEmp(EmpVO vo) {
		return (String) insert("empDAO.insertEmp", vo);
	}
	
	
	  public List<?> selectEmp(EmpVO vo) { 
		  return list("empDAO.selectEmp", vo); }
	 

}
