package com.team.project.inquiry;

import java.util.ArrayList;

public interface InquiryService {
	
	public void customer_inquiry_input_save(InquiryDTO dto);
	public ArrayList<InquiryDTO> customer_inquiry_view(String inquiry_writer_type);
}
