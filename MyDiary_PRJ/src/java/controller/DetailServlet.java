package controller;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Diary;
import util.Helper;

public class DetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int diaryId = Integer.parseInt(request.getParameter("diary_id"));
        Diary foundDiary = Helper.diaryRepository().get(diaryId);

        if (foundDiary != null) {
            request.setAttribute("viewFile", "detail.jsp");
            request.setAttribute("pageTitle", foundDiary.getDateOfDiary());
            request.setAttribute("diary", foundDiary);
        }

        Helper.view(request, response);
    }
}
