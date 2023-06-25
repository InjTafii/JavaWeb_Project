<%@tag import="util.Helper"%>
<%@tag import="model.User"%>
<%@tag import="java.util.List"%>
<%@tag import="model.Diary"%>
<%@tag description="diaryList" pageEncoding="UTF-8"%>

<% List<Diary> diaryList = (List) request.getAttribute("diaryList"); %>

<% for (Diary diary : diaryList) {

        User diaryUser = Helper.userRepository().get(diary.getUserId());
        if (diaryUser != null) {%>
<div class="col s12">
    <div class="card">
        <div class="card-content">
            <h3><%=diary.getTitle()%></h3>
            <a href="detail?diary_id=<%=diary.getId()%>"><%=diary.getDateOfDiary()%></a>
            <p class="flow-text"><%=diary.getContent()%></p>
            <br>
            <a href="edit?diary_id=<%=diary.getId()%>">Edit</a><br><br>
            <a href="delete?diary_id=<%=diary.getId()%>&&isPresent=true">Delete</a><br><br>
            
        </div>
        <div class="card-action">
            <a href="profile?user_id=<%=diary.getUserId()%>"><%=diaryUser.toString().toUpperCase()%></a>
        </div>
    </div>
</div>
<% } } %>
