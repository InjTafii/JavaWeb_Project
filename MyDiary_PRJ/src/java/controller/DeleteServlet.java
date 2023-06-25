package controller;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Diary;
import util.Helper;

public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int diaryId = Integer.parseInt(request.getParameter("diary_id"));
        Diary foundDiary = Helper.diaryRepository().get(diaryId);
        if (foundDiary != null) {
            Helper.diaryRepository().remove(diaryId);
        } 
        if(request.getParameter("isPresent") != null && request.getParameter("isPresent").equals("true")){
            response.sendRedirect("index");
        }
        else {
            response.sendRedirect("mydiaries");
        }
    }
}
