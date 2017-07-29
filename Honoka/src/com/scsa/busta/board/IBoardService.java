package com.scsa.busta.board;

import java.util.List;

public interface IBoardService {
	
	void sugWrite(SuggestionVO suggestion);
	List<SuggestionVO> searchSugList();
	List<SuggestionVO> searchSug(String title, String content);
	SuggestionVO getSugDetail(int sugnum);
	void updateSugCount(int sugnum, int count);
	void sugDelete(int sugnum);
	void sugUpdate(SuggestionVO suggestion);
	
	void lostWrite(LostBoardVO lost);
	List<LostBoardVO> searchLostList();
	List<LostBoardVO> searchLostNFound(String title, String content);
	LostBoardVO getLostDetail(int lostnum);
	void updateLostCount(int lostnum, int count);
	void lostDelete(int lostnum);
	void lostUpdate(LostBoardVO lost);
	
	void lostRepltWrite(ReplyVO reply);
	List<ReplyVO> lostReplyList(int gulnum);
	void lostReplyUpdate(ReplyVO reply);
	ReplyVO lostReply(int replynum);
	void lostReplyDelete(int replynum);
	
	void sugRepltWrite(ReplyVO reply);
	List<ReplyVO> sugReplyList(int gulnum);
	void sugReplyUpdate(ReplyVO reply);
	ReplyVO sugReply(int replynum);
	void sugReplyDelete(int replynum);

}
