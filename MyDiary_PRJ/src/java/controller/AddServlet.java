package controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Diary;
import model.User;
import util.Helper;


public class AddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("viewFile", "add.jsp");
        DateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        request.setAttribute("pageTitle", "Add new diary / "
                + sdf.format(new Date()));
        Helper.view(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User loginUser = (User) Helper.getLoginUser(request);
        String title = request.getParameter("diaryTitle");
        String diaryContent = request.getParameter("diaryContent");
        boolean visible = request.getParameter("visible") != null;
        Diary newDiary = new Diary();
        newDiary.setUserId(loginUser.getId());
        newDiary.setDateOfDiary(new Date());
        newDiary.setContent(diaryContent);
        newDiary.setVisibility(visible);
        newDiary.setTitle(title);
        newDiary.setFavourite(false);
        boolean addResult = Helper.diaryRepository().add(newDiary);
        if (!addResult) {
            request.setAttribute("viewFile", "add.jsp");
            DateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
            request.setAttribute("pageTitle", "Add new diary / "
                    + sdf.format(new Date()));
            request.setAttribute("message", "Something went wrong");
            Helper.view(request, response);
        } else {
            response.sendRedirect("mydiaries");
        }

    }
}
