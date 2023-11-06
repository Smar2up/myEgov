package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {

		/*
		 * System.out.println(vo.getUnq()); System.out.println(vo.getTitle());
		 * System.out.println(vo.getPass()); System.out.println(vo.getName());
		 * System.out.println(vo.getContent()); System.out.println(vo.getRdate());
		 */
		String result = boardService.insertNBoard(vo);
		
		//System.out.println("result data 출력" + result);
		
		String msg = "";
		if( result == null ) msg = "ok";
		else msg = "fail";
		
		//System.out.println(msg);
		return msg;
	}
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		// 페이치에 보여질 게시물 갯수
		int unit = 5;
		// 총 데이터 개수
		int total = boardService.selectNBoardTotal(vo);

		int totalPage = (int) Math.ceil( (double)total/unit );
		
		int viewPage = vo.getViewPage();
		
		if( viewPage > totalPage || viewPage < 1) viewPage = 1;
		
		// 1 -> 01 ~ 10  2-> 11 ~ 20 3-> 21 ~ 30
		int startIndex = (viewPage-1)*unit + 1;
		int endIndex = startIndex + (unit - 1);
		// 처음 시작번호를 계산  1페이지는 total -> -9까지 / 2페이지는 (total - 9)마지막번호 - 1 -> -9까지 / 3페이지는 ((total - 9)-1)-9)-1 
		// total - 10(viewPage-1)
		int startRowNo = total - (viewPage-1)*unit;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);		
		
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list : " + list);
		
		model.addAttribute("rowNumber", startRowNo);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("resultList", list);
		
		return "board/boardList";
	}
	
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception {
		
		//조회수 증가
		boardService.updateNBoardHits(vo.getUnq());
		
		//상세 보기
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		//content 줄바꿈 나타내기 방법1
		String content = boardVO.getContent();  // \n형식
		boardVO.setContent(content.replace("\n", "<br>"));
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception {
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardModifyWrite";
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateNBoard(BoardVO vo) throws Exception {
		
		int result = 0;
		
		int count = boardService.selectNBoardPass(vo);	// count = 1
		if( count == 1 ) {
			result = boardService.updateNBoard(vo);		// result = 1    1+""면 string형태로 변환
		} else {
			result = -1;
		}
		return result+"";
	}
	
	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap model) {
				
		model.addAttribute("unq", unq);
		
		return "board/passWrite";
	}
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteNBoard(BoardVO vo) throws Exception {
		
		int result = 0;
		//암호 일치 검사
		int count = boardService.selectNBoardPass(vo);	// count = 1 (패스워드 일치:정상)
		
		if( count == 1 ) {
			result = boardService.deleteNBoard(vo);		// result = 1
		}else if( count == 0) {
			result = -1;
		}
		
		return result+"";
	}

}
