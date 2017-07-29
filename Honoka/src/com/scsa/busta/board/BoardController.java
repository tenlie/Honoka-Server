package com.scsa.busta.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Autowired
	IBoardService service;
	
	@RequestMapping("/index.do")
	public String index(Model m) {
		return "redirect:index.jsp";
	}
	
	@RequestMapping("/aboutcompany.do")
	public String aboutcompany(Model m){
		m.addAttribute("content", "view/aboutcompany.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("/privacypolicy.do")
	public String privacypolicy(Model m){
		m.addAttribute("content", "view/privacypolicy.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("/agreement.do")
	public String agreement(Model m){
		m.addAttribute("content", "view/agreement.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("/guide.do")
	public String guide(Model m){
		m.addAttribute("content", "view/guide.jsp");
		return "index.jsp";
	}
	
	//而ㅻ�ㅻ땲�떚 硫붿씤
	@RequestMapping("/community_main.do")
	public String community_main(Model m) {
		List<SuggestionVO> sugList=service.searchSugList();
		List<LostBoardVO> lostList=service.searchLostList();
		m.addAttribute("sugList", sugList);
		m.addAttribute("lostList", lostList);
		m.addAttribute("content", "view/community_main.jsp");
		return "index.jsp";
	}
	
	/*嫄댁쓽�궗�빆 湲��벐湲� �럹�씠吏�濡� �씠�룞*/
	@RequestMapping("/sugWritePage.do")
	public String sugWritePage(Model m) {
		m.addAttribute("content", "view/sug_write.jsp");
		return "index.jsp";
	}
	
	/*嫄댁쓽�궗�빆 湲� 寃��깋*/
	@RequestMapping("/searchSug.do")
	@ResponseBody
	public List<SuggestionVO> searchSug(@RequestParam String searchOption, @RequestParam String title, @RequestParam String content, Model m){
		if(searchOption.equals("title")){
			content = null;
		}else if(searchOption.equals("content")){
			title = null;
		}
		List<SuggestionVO> list = service.searchSug(title, content);
		return list;
	}
	
	/*嫄댁쓽�궗�빆 湲� �벑濡�*/
	@RequestMapping(value="/sugWrite.do", method=RequestMethod.POST)
	public String sugWrite(SuggestionVO suggestion, String content, Model m) {
		content=content.replace("\r\n", "</br>");
		suggestion.setContent(content);
		service.sugWrite(suggestion);
		return "redirect:searchSugList.do?page=1";
	}
	
	/*嫄댁쓽�궗�빆 湲� 紐⑸줉&�뙎湲� �닔*/
	@RequestMapping("/searchSugList.do")
	public String searchSugList(int page, Model m) {
		List<SuggestionVO> list=service.searchSugList();
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		m.addAttribute("content", "view/sug_list.jsp");
		return "index.jsp";
	}
	
	/*嫄댁쓽�궗�빆 湲� �씫湲�&議고쉶�닔 +1*/
	@RequestMapping("/getSugDetail.do")
	public String getSugDetail(int sugnum, int count, int page, Model m) {
		service.updateSugCount(sugnum, count);
		SuggestionVO sug=service.getSugDetail(sugnum);
		List<ReplyVO> list=service.sugReplyList(sugnum);
		m.addAttribute("sug", sug);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		m.addAttribute("content", "view/sug_detail.jsp");
		return "index.jsp";
	}
	
	/*嫄댁쓽�궗�빆 湲� �궘�젣*/
	@RequestMapping("/sugDelete.do")
	public String sugDelete(int sugnum, Model m) {
		service.sugDelete(sugnum);
		return "redirect:searchSugList.do?page=1";
	}
	
	/*嫄댁쓽�궗�빆 湲��닔�젙 �럹�씠吏�濡� �씠�룞*/
	@RequestMapping("/sugUpdatePage.do")
	public String sugUpdatePage(int sugnum, int page, Model m) {
		SuggestionVO sug=service.getSugDetail(sugnum);
		m.addAttribute("sug", sug);
		m.addAttribute("page", page);
		m.addAttribute("content", "view/sug_write.jsp");
		return "index.jsp";
	}
	
	/*嫄댁쓽�궗�빆 湲� �닔�젙*/
	@RequestMapping("/sugUpdate.do")
	public String sugUpdate(SuggestionVO suggestion, String content, int sugnum, int count, int page, Model m) {
		content=content.replace("\r\n", "</br>");
		suggestion.setContent(content);
		service.sugUpdate(suggestion);
		m.addAttribute("page", page);
		return "redirect:getSugDetail.do?sugnum="+sugnum+"&count="+count+"&page="+page;
	}
	
	/*嫄댁쓽�궗�빆 �뙎湲� �벑濡�*/
	@RequestMapping("/sugReplyWrite.do")
	public String sugReplyWrite(ReplyVO reply, int sugnum, int count, int page) {
		service.sugRepltWrite(reply);
		return "redirect:getSugDetail.do?sugnum="+sugnum+"&count="+count+"&page="+page;
	}
	
	/*嫄댁쓽�궗�빆 �뙎湲� �닔�젙 �떆 �꽑�깮*/
	@RequestMapping("/sugReply.do")
	@ResponseBody
	public ReplyVO sugReply(int replynum) {
		ReplyVO reply=service.sugReply(replynum);
		return reply;
	}
	
	/*嫄댁쓽�궗�빆 �뙎湲� �닔�젙*/
	@RequestMapping("/sugReplyUpdate.do")
	public String sugReplyUpdate(ReplyVO reply, int sugnum, int count, int page) {
		service.sugReplyUpdate(reply);
		return "redirect:getSugDetail.do?sugnum="+sugnum+"&count="+count+"&page="+page;
	}
	
	/*嫄댁쓽�궗�빆 �뙎湲� �궘�젣*/
	@RequestMapping("/sugReplyDelete.do")
	public String sugReplyDelete(int replynum, int sugnum, int count, int page) {
		service.sugReplyDelete(replynum);
		return "redirect:getSugDetail.do?sugnum="+sugnum+"&count="+count+"&page="+page;
	}
	

	/*遺꾩떎臾� 湲��벐湲� �럹�씠吏�濡� �씠�룞*/
	@RequestMapping("/lostWritePage.do")
	public String lostWritePage(Model m) {
		m.addAttribute("content", "view/lost_write.jsp");
		return "index.jsp";
	}
	
	
	/*遺꾩떎臾� 湲� 紐⑸줉*/
	@RequestMapping("/searchLostList.do")
	public String searchLostList(int page, Model m) {
		List<LostBoardVO> list=service.searchLostList();
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		m.addAttribute("content", "view/lost_list.jsp");
		return "index.jsp";
	}
	
	/*遺꾩떎臾� 湲� 寃��깋*/
	@RequestMapping("/searchLostNFound.do")
	@ResponseBody
	public List<LostBoardVO> searchLostNFound(@RequestParam String searchOption, @RequestParam String title, @RequestParam String content, Model m){
		if(searchOption.equals("title")){
			content = null;
		}else if(searchOption.equals("content")){
			title = null;
		}
		List<LostBoardVO> list=service.searchLostNFound(title, content);
		return list;
	}
	
	/*遺꾩떎臾� 湲� �벑濡�*/
	@RequestMapping(value="/lostWrite.do", method=RequestMethod.POST)
	public String lostWrite(LostBoardVO lost, String content, @RequestParam("lostimage") MultipartFile file,
			HttpServletRequest req, Model m) throws IllegalStateException, IOException {
		String fileName=file.getOriginalFilename().trim();
		if(!fileName.equals("")){
		String path=req.getServletContext().getRealPath("/img");
		File myFile=new File(path, fileName);
		file.transferTo(myFile);
		lost.setImage(fileName);
		}else if(fileName.equals("")){
			lost.setImage("");
		}
		content=content.replace("\r\n", "</br>");
		lost.setContent(content);
		service.lostWrite(lost);
		return "redirect:searchLostList.do?page=1";
	}
	
	
	/*遺꾩떎臾� 湲� �씫湲�&議고쉶�닔 +1&�뙎湲�蹂닿린*/
	@RequestMapping("/getLostDetail.do")
	public String getLostDetail(int lostnum, int count, int page, Model m) {
		service.updateLostCount(lostnum, count);
		LostBoardVO lost=service.getLostDetail(lostnum);
		List<ReplyVO> list=service.lostReplyList(lostnum);
		m.addAttribute("lost", lost);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		m.addAttribute("content", "view/lost_detail.jsp");
		return "index.jsp";
	}
	
	/*遺꾩떎臾� 湲� �궘�젣*/
	@RequestMapping("/lostDelete.do")
	public String lostDelete(int lostnum, Model m) {
		service.lostDelete(lostnum);
		return "redirect:searchLostList.do?page=1";
	}
	
	/*遺꾩떎臾� 湲��닔�젙 �럹�씠吏�濡� �씠�룞*/
	@RequestMapping("/lostUpdatePage.do")
	public String lostUpdatePage(int lostnum, int page, Model m) {
		LostBoardVO lost=service.getLostDetail(lostnum);
		m.addAttribute("lost", lost);
		m.addAttribute("page", page);
		m.addAttribute("content", "view/lost_write.jsp");
		return "index.jsp";
	}
	
	/*遺꾩떎臾� 湲� �닔�젙*/
	@RequestMapping("/lostUpdate.do")
	public String lostUpdate(LostBoardVO lost, String content, @RequestParam("lostimage") MultipartFile file,
			HttpServletRequest req, int lostnum, int count, int page, Model m) throws IllegalStateException, IOException {
		String fileName=file.getOriginalFilename().trim();
		if(!fileName.equals("")){
			String path=req.getServletContext().getRealPath("/img");
			File myFile=new File(path, fileName);
			file.transferTo(myFile);
			lost.setImage(fileName);
			}else if(fileName.equals("")){
				lost.setImage("");
			}
		content=content.replace("\r\n", "</br>");
		lost.setContent(content);
		service.lostUpdate(lost);
		m.addAttribute("page", page);
		return "redirect:getLostDetail.do?lostnum="+lostnum+"&count="+count+"&page="+page;
	}
	
	/*遺꾩떎臾� �뙎湲� �벑濡�*/
	@RequestMapping("/lostReplyWrite.do")
	public String lostReplyWrite(ReplyVO reply, int lostnum, int count, int page) {
		service.lostRepltWrite(reply);
		return "redirect:getLostDetail.do?lostnum="+lostnum+"&count="+count+"&page="+page;
	}
	
	/*遺꾩떎臾� �뙎湲� �닔�젙 �떆 �꽑�깮*/
	@RequestMapping("/lostReply.do")
	@ResponseBody
	public ReplyVO lostReply(int replynum) {
		ReplyVO reply=service.lostReply(replynum);
		return reply;
	}
	
	/*遺꾩떎臾� �뙎湲� �닔�젙*/
	@RequestMapping("/lostReplyUpdate.do")
	public String lostReplyUpdate(ReplyVO reply, int lostnum, int count, int page) {
		service.lostReplyUpdate(reply);
		return "redirect:getLostDetail.do?lostnum="+lostnum+"&count="+count+"&page="+page;
	}
	
	/*遺꾩떎臾� �뙎湲� �궘�젣*/
	@RequestMapping("/lostReplyDelete.do")
	public String lostReplyDelete(int replynum, int lostnum, int count, int page) {
		service.lostReplyDelete(replynum);
		return "redirect:getLostDetail.do?lostnum="+lostnum+"&count="+count+"&page="+page;
	}

}
