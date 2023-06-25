package controller;

import util.Helper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Diary;
import model.User;

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("user");
        request.setAttribute("viewFile", "index.jsp");
        request.setAttribute("pageTitle", "Your secrets are kept private here!!");
        List<Diary> list = Helper.diaryRepository().getFavourite(u != null ? u.getId() : null);
        session.setAttribute("diaryList", list);
        request.setAttribute("diaryList", Helper.diaryRepository().getByUserID(u != null ? u.getId() : null));
        request.setAttribute("userList", Helper.userRepository().getAll());
        Helper.view(request, response);
    }

}
