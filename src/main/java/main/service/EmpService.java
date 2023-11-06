package main.service;

import java.util.List;

public interface EmpService {
	
	/*
	 * 입력
	 */
	public String insertEmp(EmpVO vo) throws Exception;
	
	/*
	 * 조회 		방법1 재직상태 (전체  | 재직 휴직 퇴직 ) 방법2 성명 부서 입사일자
	 */
	public List<?> selectEmp(EmpVO vo) throws Exception;

}
