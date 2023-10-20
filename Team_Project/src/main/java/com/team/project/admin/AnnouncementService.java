package com.team.project.admin;

import java.util.ArrayList;

public interface AnnouncementService {

	public void announcementinsert(AnnouncementDTO dto);
	public ArrayList<AnnouncementDTO> announcement_list();
	public void announcement_list_delete(String parameter);
}
