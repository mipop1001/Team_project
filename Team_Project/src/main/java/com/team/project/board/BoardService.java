package com.team.project.board;

import java.util.ArrayList;

public interface BoardService {

	public void customer_community_input_save(String community_board_title, String community_board_content,
			String community_board_location, int community_board_grade,
			String community_board_sum_image, String community_board_detail_image1,
			String community_board_detail_image2, String community_board_detail_image3, int member_number);

	public ArrayList<BoardDTO> customer_community_out();

	public ArrayList<BoardDTO> customer_community_detail(int community_board_number);

	public void customer_community_delete(int community_board_number);

	public ArrayList<BoardDTO> customer_community_modify_get(int community_board_number);

	public void customer_community_modify_input_save(int community_board_number, String community_board_title,
			String community_board_content, String community_board_date, String community_board_location,
			int community_board_grade, String community_board_sum_image, String community_board_detail_image1,
			String community_board_detail_image2, String community_board_detail_image3);

	public int boardcntnotice();

	public ArrayList<BoardDTO> boardnotice(PageDTO dto);

	//댓글
	public void board_comment_save(String member_id,int board_number,String comment_text);
	public ArrayList<BoardCommentDTO> board_comment_view(int board_number);
	
	//나의 게시글
	public ArrayList<BoardDTO> my_community_content(int member_number);

	//나의 게시글 삭제
	public void delete_comment(String commentid, String commenttext, int commentnumber);
}
