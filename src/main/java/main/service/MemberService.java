package main.service;

import java.util.List;

public interface MemberService {
	
	/*
	 *  회원등록처리 (save)
	 */
	public String insertMember(MemberVO vo) throws Exception;
	
	/*
	 * 중복아이디 체크
	 */
	public int selectMemberIdCheck(String userid) throws Exception;
	
	/*
	 * 우편번호(주소) 검색
	 */
	public List<?> selectPostList(String dong) throws Exception;
	
	/*
	 * 로그인 데이터 확인
	 */
	public int selectMemberCount(MemberVO vo) throws Exception;
	
	// 영상 학습 이후 개인 학습 시작 23-10-18
	/*
	 *  회원정보 수정
	 */
	public MemberVO selectMemberDetail(String userid) throws Exception;

}
