package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.EmpService;
import main.service.EmpVO;

@Service("empService")
public class EmpServiceImpl implements EmpService {
	
	@Resource(name="empDAO")
	private EmpDAO empDAO;
	
	@Override
	public String insertEmp(EmpVO vo) throws Exception {
		return (String) empDAO.insertEmp(vo);
	}

	
	  @Override public List<?> selectEmp(EmpVO vo) throws Exception { 
		  return empDAO.selectEmp(vo); }
	 

}
