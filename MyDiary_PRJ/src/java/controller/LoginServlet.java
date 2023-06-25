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

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("viewFile", "login.jsp");
        request.setAttribute("pageTitle", "Login");
        Helper.view(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] parameters = {"email", "password"};
        boolean checkResult = Helper
                .checkParameters(parameters, request.getParameterMap());

        if (!checkResult) {
            request.setAttribute("viewFile", "login.jsp");
            request.setAttribute("message", "Please fill all field");
            Helper.view(request, response);
        } else {

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            User user = Helper.userRepository()
                    .login(email, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                List<Diary> list = Helper.diaryRepository().getFavourite(user != null ? user.getId() : null);
                session.setAttribute("diaryList", list);
                response.sendRedirect("mydiaries");
            } else {
                request.setAttribute("message", "No user found.");
                request.setAttribute("viewFile", "login.jsp");
                request.setAttribute("pageTitle", "Login");
                Helper.view(request, response);
            }
        }

    }
}
