package com.mvc.board;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = BoardDAO.getInstance();
		
		List<BoardDTO> list = dao.boardList();
		
		request.setAttribute("list", list);
		
		return "board/boardList.jsp";
	}

}
