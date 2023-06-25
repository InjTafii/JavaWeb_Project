package controller;

import model.Diary;
import util.Helper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("user_id"));
        User foundUser = Helper.userRepository().get(userId);

        if (foundUser != null) {
            request.setAttribute("viewFile", "profile.jsp");
            request.setAttribute("pageTitle", foundUser.toString());
            request.setAttribute("diaryList", Helper.diaryRepository()
                    .getAllByUserId(userId, false));
        }

        Helper.view(request, response);
    }
}
