package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO")
public class CodeDAO extends EgovAbstractDAO{

	public String insertCodes(CodeVO vo) {
		return (String) insert("codeDAO.insertCodes", vo);
	}

	public List<?> selectCodesList(CodeVO vo) {
		return list("codeDAO.selectCodesList", vo);
	}

	public int selectCodesCount(CodeVO vo) {
		return (int) select("codeDAO.selectCodesCount", vo);
	}

	public int deleteCodes(int code) {
		return delete("codeDAO.deleteCodes", code);
	}

	public CodeVO selectCodesDetail(int code) {
		return (CodeVO) select("codeDAO.selectCodesDetail", code);
	}

	public int updateCodes(CodeVO vo) {
		return (int) update("codeDAO.updateCodes", vo);
	}
	

}
