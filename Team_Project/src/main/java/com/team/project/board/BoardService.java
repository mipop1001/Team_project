package com.team.project.board;

import java.util.ArrayList;

public interface BoardService {

	public void customer_community_input_save(String community_board_title, String community_board_content,
			String community_board_location, int community_board_grade,
			String community_board_sum_image, String community_board_detail_image1,
			String community_board_detail_image2, String community_board_detail_image3);

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


}
