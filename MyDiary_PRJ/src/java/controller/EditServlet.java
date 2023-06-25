package controller;

import model.Diary;
import util.Helper;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int diaryId = Integer.parseInt(request.getParameter("diary_id"));
        Diary foundDiary = Helper.diaryRepository().get(diaryId);

        if (foundDiary != null) {
            request.setAttribute("viewFile", "edit.jsp");
            DateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
            request.setAttribute("pageTitle", "Edit diary / "
                    + sdf.format(foundDiary.getDateOfDiary()));
            request.setAttribute("diary", foundDiary);
            Helper.view(request, response);
        } else {
            response.sendRedirect("mydiaries");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int diaryId = Integer.parseInt(request.getParameter("diary_id"));
        Diary foundDiary = Helper.diaryRepository().get(diaryId);

        if (foundDiary != null) {
            String title = request.getParameter("diaryTitle");
            String diaryContent = request.getParameter("diaryContent");
            boolean visible = request.getParameter("visible") != null;
            foundDiary.setContent(diaryContent);
            foundDiary.setVisibility(visible);
            foundDiary.setTitle(title);
            Diary editResult = Helper.diaryRepository()
                    .update(foundDiary.getId(), foundDiary);

            if (editResult != null) {
                response.sendRedirect("mydiaries");
            } else {
                request.setAttribute("viewFile", "edit.jsp");
                DateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                request.setAttribute("pageTitle", "Edit diary / "
                        + sdf.format(foundDiary.getDateOfDiary()));
                request.setAttribute("message", "Something went wrong");
                Helper.view(request, response);
            }
        } else {
            response.sendRedirect("mydiaries");
        }

    }
}
