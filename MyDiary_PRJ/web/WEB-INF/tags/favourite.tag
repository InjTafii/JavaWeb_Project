<%@tag import="util.Helper"%>
<%@tag import="model.User"%>
<%@tag import="java.util.List"%>
<%@tag import="model.Diary"%>
<%@tag description="favourite" pageEncoding="UTF-8"%>

<% List<Diary> diaryList = (List) request.getAttribute("diaryList"); %>

<% for (Diary diary : diaryList) {

        User diaryUser = Helper.userRepository().get(diary.getUserId());
        if (diaryUser != null) {%>
<div class="col s12">
    <div class="card">
        <div class="card-content">
            <a href="detail?diary_id=<%=diary.getId()%>"><%=diary.getDateOfDiary()%></a>
            <p class="flow-text"><%=diary.getContent()%></p>
            <br>
        </div>
        <div class="card-action">
            <a href="profile?user_id=<%=diary.getUserId()%>"><%=diaryUser.toString().toUpperCase()%></a>
        </div>
    </div>
</div>
<% } } %>