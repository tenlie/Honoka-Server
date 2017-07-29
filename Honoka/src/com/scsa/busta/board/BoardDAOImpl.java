package com.scsa.busta.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements IBoardDAO {
	
	@Autowired
	SqlSession session;

	//건의사항 글 쓰기
	@Override
	public void sugWrite(SuggestionVO suggestion) {
		session.insert("board.sugWrite", suggestion);
	}

	//건의사항 글 목록
	@Override
	public List<SuggestionVO> searchSugList() {
		List<SuggestionVO> list=session.selectList("board.searchSugList");
		return list;
	}

	//건의사항 글 검색
	@Override
	public List<SuggestionVO> searchSug(String title, String content) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("title", title);
		map.put("content", content);		
		List<SuggestionVO> list = session.selectList("board.searchSug", map);
		return list;
	}

	//건의사항 글 읽기
	@Override
	public SuggestionVO getSugDetail(int sugnum) {
		SuggestionVO suggestion=session.selectOne("board.getSugDetail", sugnum);
		return suggestion;
	}
	
	//건의사항 조회수 +1
	@Override
	public void updateSugCount(int sugnum, int count) {
		Map<String, Object> map=new HashMap<>();
		map.put("sugnum", sugnum);
		map.put("count", count);
		session.update("board.updateSugCount", map);
	}

	//건의사항 글 삭제
	@Override
	public void sugDelete(int sugnum) {
		session.delete("board.sugDelete", sugnum);
	}

	//건의사항 글 수정
	@Override
	public void sugUpdate(SuggestionVO suggestion) {
		session.update("board.sugUpdate", suggestion);
	}
	
	//건의사항 댓글 작성
	@Override
	public void sugRepltWrite(ReplyVO reply) {
		session.insert("board.sugReplyWrite", reply);
	}

	//건의사항 댓글 리스트
	@Override
	public List<ReplyVO> sugReplyList(int gulnum) {
		List<ReplyVO> list=session.selectList("board.sugReplyList", gulnum);
		return list;
	}

	//건의사항 리플 수정
	@Override
	public void sugReplyUpdate(ReplyVO reply) {
		session.update("board.sugReplyUpdate", reply);
	}

	//건의사항 리플 수정 시 선택
	@Override
	public ReplyVO sugReply(int replynum) {
		ReplyVO reply=session.selectOne("board.sugReplyDetail", replynum);
		return reply;
	}

	//건의사항 리플 삭제
	@Override
	public void sugReplyDelete(int replynum) {
		session.delete("board.sugReplyDelete", replynum);
	}

	//분실물 글 작성
	@Override
	public void lostWrite(LostBoardVO lost) {
		session.insert("board.lostWrite", lost);
	}

	//분실물 글 목록
	@Override
	public List<LostBoardVO> searchLostList() {
		List<LostBoardVO> list=session.selectList("board.searchLostList");
		return list;
	}
	
	//분실물 글 검색
	@Override
	public List<LostBoardVO> searchLostNFound(String title, String content) {
		System.out.println("dao에서 searchLostNFound실행");
		Map<String, String> map=new HashMap<String, String>();
		map.put("title", title);
		map.put("content", content);
		List<LostBoardVO> list = session.selectList("board.searchLostNFound", map);
		return list;
	}

	//분실물 글 읽기
	@Override
	public LostBoardVO getLostDetail(int lostnum) {
		 LostBoardVO lost=session.selectOne("board.getLostDetail", lostnum);
		return lost;
	}
	
	//분실물 조회수 +1
	@Override
	public void updateLostCount(int lostnum, int count) {
		Map<String, Object> map=new HashMap<>();
		map.put("lostnum", lostnum);
		map.put("count", count);
		session.update("board.updateLostCount", map);
	}

	//분실물 글 삭제
	@Override
	public void lostDelete(int lostnum) {
		session.delete("board.lostDelete", lostnum);
	}

	//분실물 글 수정
	@Override
	public void lostUpdate(LostBoardVO lost) {
		session.update("board.lostUpdate", lost);
	}

	//분실물 댓글 작성
	@Override
	public void lostRepltWrite(ReplyVO reply) {
		session.insert("board.lostReplyWrite", reply);
	}

	//분실물 댓글 목록
	@Override
	public List<ReplyVO> lostReplyList(int gulnum) {
		List<ReplyVO> list=session.selectList("board.lostReplyList", gulnum);
		return list;
	}

	//분실물 댓글 수정
	@Override
	public void lostReplyUpdate(ReplyVO reply) {
		session.update("board.lostReplyUpdate", reply);
	}

	//분실물 댓글 수정 시 선택
	@Override
	public ReplyVO lostReply(int replynum) {
		ReplyVO reply=session.selectOne("board.lostReplyDetail", replynum);
		return reply;
	}

	//분실물 댓글 삭제
	@Override
	public void lostReplyDelete(int replynum) {
		session.delete("board.lostReplyDelete", replynum);
	}

}
