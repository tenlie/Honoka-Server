package com.scsa.busta.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements IBoardService {
	
	@Autowired
	IBoardDAO dao;

	@Override
	public void sugWrite(SuggestionVO suggestion) {
		dao.sugWrite(suggestion);
	}

	@Override
	public List<SuggestionVO> searchSugList() {
		List<SuggestionVO> list=dao.searchSugList();
		return list;
	}

	@Override
	public List<SuggestionVO> searchSug(String title, String content) {
		List<SuggestionVO> list=dao.searchSug(title, content);
		return list;
	}

	@Override
	public SuggestionVO getSugDetail(int sugnum) {
		SuggestionVO suggestion=dao.getSugDetail(sugnum);
		return suggestion;
	}

	@Override
	public void updateSugCount(int sugnum, int count) {
		dao.updateSugCount(sugnum, count+1);
	}

	@Override
	public void sugDelete(int sugnum) {
		dao.sugDelete(sugnum);
	}

	@Override
	public void sugUpdate(SuggestionVO suggestion) {
		dao.sugUpdate(suggestion);
	}

	@Override
	public void lostWrite(LostBoardVO lost) {
		dao.lostWrite(lost);
	}

	@Override
	public List<LostBoardVO> searchLostList() {
		List<LostBoardVO> list=dao.searchLostList();
		return list;
	}
	
	@Override
	public List<LostBoardVO> searchLostNFound(String title, String content) {
		List<LostBoardVO> list=dao.searchLostNFound(title, content);
		return list;
	}
	
	@Override
	public LostBoardVO getLostDetail(int lostnum) {
		LostBoardVO lost=dao.getLostDetail(lostnum);
		return lost;
	}

	@Override
	public void updateLostCount(int lostnum, int count) {
		dao.updateLostCount(lostnum, count+1);
	}

	@Override
	public void lostDelete(int lostnum) {
		dao.lostDelete(lostnum);
	}

	@Override
	public void lostUpdate(LostBoardVO lost) {
		dao.lostUpdate(lost);
	}

	@Override
	public void lostRepltWrite(ReplyVO reply) {
		dao.lostRepltWrite(reply);
	}

	@Override
	public List<ReplyVO> lostReplyList(int gulnum) {
		List<ReplyVO> list=dao.lostReplyList(gulnum);
		return list;
	}

	@Override
	public void lostReplyUpdate(ReplyVO reply) {
		dao.lostReplyUpdate(reply);
	}

	@Override
	public ReplyVO lostReply(int replynum) {
		ReplyVO reply=dao.lostReply(replynum);
		return reply;
	}

	@Override
	public void lostReplyDelete(int replynum) {
		dao.lostReplyDelete(replynum);
	}

	@Override
	public void sugRepltWrite(ReplyVO reply) {
		dao.sugRepltWrite(reply);
	}

	@Override
	public List<ReplyVO> sugReplyList(int gulnum) {
		List<ReplyVO> list=dao.sugReplyList(gulnum);
		return list;
	}

	@Override
	public void sugReplyUpdate(ReplyVO reply) {
		dao.sugReplyUpdate(reply);
	}

	@Override
	public ReplyVO sugReply(int replynum) {
		ReplyVO reply=dao.sugReply(replynum);
		return reply;
	}

	@Override
	public void sugReplyDelete(int replynum) {
		dao.sugReplyDelete(replynum);
	}

}
