package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import main.service.EmpService;
import main.service.EmpVO;

@Controller
public class EmpController {
	
	@Resource(name="empService")
	private EmpService empService;
	
	@RequestMapping("/empWrite.do")
	public String empInfoWrite() throws Exception {
		return "emp/empWrite";
	}
	
	@RequestMapping("/empWriteSave.do")
	@ResponseBody
	public String insertEmp(EmpVO vo) throws Exception {
		
		String msg = "";
		
		System.out.println("sql 입력");
		//System.out.println("이름: " + vo.getName());
		//System.out.println("번호: " + vo.getEmpno());
		//System.out.println("부서: " + vo.getDname());
		//System.out.println("직책: " + vo.getPosition());
		//System.out.println("성별: " + vo.getGender());
		//System.out.println("전화: " + vo.getPhone());
		//System.out.println("이메일: " + vo.getEmail());
		//System.out.println("날짜형식" + vo.getStartdate());
		String result = empService.insertEmp(vo);
		System.out.println("insert afterfore sql : " + result);
		if( result == null) {
			msg = "ok";
		}
		
		return msg;
	}
	
	//@RequestMapping("/empInfo.do")
	//public String empMain() throws Exception {
	//	return "emp/empInfo";
	//}
	
	@ResponseBody
	@RequestMapping("/empInfo.do")
	//public String selectEmp(EmpVO vo, ModelMap model) throws Exception {
	public ModelAndView selectEmp(EmpVO vo) throws Exception {	
		//if (vo.getStatus() == null) {
			if(vo.getStatus() != null) {
				vo.setStatus(vo.getStatus().replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", ""));
			}
			if(vo.getName() != null) {
				vo.setName(vo.getName().replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", ""));
			}
			if(vo.getDname() != null) {
				vo.setDname(vo.getDname().replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", ""));
			}
			if ( (vo.getStartdate() != null) && (vo.getFrom() == null) && (vo.getTo() == null) ) {
				String[] arr = (vo.getStartdate()).split(",");
				System.out.println("날짜!!!");
				if( arr.length >= 3) {
					System.out.println("날짜 자르는 중");
					String from = arr[0];
					String to = arr[1];
					vo.setFrom(from);
					vo.setTo(to);
				}
			}
		//	vo.getVOvalue(vo); // VO에 모든 객체 가져오기
			
			List<?> list = empService.selectEmp(vo);
		//	System.out.println(list); 	// 검색결과 확인하기!!!
			ModelAndView mav = new ModelAndView();
			mav.setViewName("emp/empInfo");
			mav.addObject("resultList", list);
			System.out.println(mav);
	
		//	model.addAttribute("resultList", list);
		
		return mav;
	}

}
