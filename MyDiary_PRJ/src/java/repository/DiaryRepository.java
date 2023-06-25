package repository;

import contracts.IRepository;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Diary;

public class DiaryRepository implements IRepository<Diary, Integer> {

    private final Connection database;

    public DiaryRepository(Connection database) {
        this.database = database;
    }

    @Override
    public Diary get(Integer index) {
        Diary diary = null;
        String query = "SELECT * FROM diary WHERE diary_id = ?";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, index);
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                diary = new Diary();
                diary.setId(resultSet.getInt("diary_id"));
                diary.setUserId(resultSet.getInt("user_id"));
                diary.setDateOfDiary(resultSet.getDate("date_of_diary"));
                diary.setContent(resultSet.getString("content"));
                diary.setVisibility(resultSet.getBoolean("visibility"));
                diary.setTitle(resultSet.getString(6));
                diary.setFavourite(resultSet.getBoolean(7));
            }
        } catch (Exception e) {
            return diary;
        }
        return diary;
    }

    @Override
    public List<Diary> getAll() {
        List<Diary> list = new ArrayList<>();
        String query = "SELECT * FROM diary "
                + "WHERE visibility = 1 "
                + "ORDER BY diary_id DESC";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                Diary diary = new Diary();
                diary.setId(resultSet.getInt("diary_id"));
                diary.setUserId(resultSet.getInt("user_id"));
                diary.setDateOfDiary(resultSet.getDate("date_of_diary"));
                diary.setContent(resultSet.getString("content"));
                diary.setVisibility(resultSet.getBoolean("visibility"));
                diary.setTitle(resultSet.getString(6));
                diary.setFavourite(resultSet.getBoolean(7));
                list.add(diary);
            }
        } catch (Exception ex) {
            return list;
        }
        return list;
    }

    public List<Diary> getAllByUserId(Integer userIndex, boolean showAll) {
        List<Diary> list = new ArrayList<>();

        String query = "SELECT * FROM diary "
                + "WHERE " + (!showAll ? "visibility = 1 AND " : " ")
                + "user_id = " + userIndex;
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                Diary diary = new Diary();
                diary.setId(resultSet.getInt("diary_id"));
                diary.setUserId(resultSet.getInt("user_id"));
                diary.setDateOfDiary(resultSet.getDate("date_of_diary"));
                diary.setContent(resultSet.getString("content"));
                diary.setVisibility(resultSet.getBoolean("visibility"));
                diary.setTitle(resultSet.getString(6));
                diary.setFavourite(resultSet.getBoolean(7));
                list.add(diary);
            }
        } catch (Exception ex) {
            return list;
        }
        return list;
    }

    @Override
    public boolean add(Diary diary) {
        boolean result = false;
        String query = "INSERT INTO [dbo].[diary]\n"
                + "           ([user_id]\n"
                + "           ,[date_of_diary]\n"
                + "           ,[content]\n"
                + "           ,[visibility]\n"
                + "           ,[title]\n"
                + "           ,[favourite])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, diary.getUserId());
            ptm.setString(2, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                    .format(diary.getDateOfDiary()));
            ptm.setString(3, diary.getContent());
            ptm.setInt(4, diary.isVisibility() ? 1 : 0);
            ptm.setString(5, diary.getTitle());
            ptm.setInt(6, diary.isFavourite() ? 1 : 0);
            ptm.executeUpdate();
            result = true;
        } catch (Exception ex) {
            return result;
        }
        return result;
    }

    @Override
    public Diary update(Integer index, Diary diary) {
        Diary updatedDiary = get(index);
        String query = "UPDATE [dbo].[diary]\n"
                + "   SET [user_id] = ?\n"
                + "      ,[date_of_diary] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[visibility] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[favourite] = ?\n"
                + " WHERE diary_id = ?";

        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, diary.getUserId());
            ptm.setDate(2, (Date) diary.getDateOfDiary());
            ptm.setString(3, diary.getContent());
            ptm.setInt(4, diary.isVisibility() ? 1 : 0);
            ptm.setString(5, diary.getTitle());
            ptm.setInt(6, diary.isFavourite() ? 1 : 0);
            ptm.setInt(7, diary.getId());
            ptm.executeUpdate();
            boolean result = true;
            updatedDiary = result ? updatedDiary : diary;
        } catch (Exception ex) {
            return updatedDiary;
        }
        return updatedDiary;
    }

    @Override
    public Diary remove(Integer index) {
        String query = "DELETE FROM diary WHERE diary_id = ?";
        Diary deletedDiary = get(index);
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, index);
            ptm.executeUpdate();
        } catch (Exception ex) {
            return deletedDiary;
        }
        return deletedDiary;
    }

    public List<Diary> getByUserID(Integer index) {
        List<Diary> list = new ArrayList<>();
        if (index == null) {
            return list;
        }
        String query = "SELECT * FROM diary WHERE visibility = 1 and user_id  = ? ORDER BY diary_id DESC";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, index.intValue());
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                Diary diary = new Diary();
                diary.setId(resultSet.getInt("diary_id"));
                diary.setUserId(resultSet.getInt("user_id"));
                diary.setDateOfDiary(resultSet.getDate("date_of_diary"));
                diary.setContent(resultSet.getString("content"));
                diary.setVisibility(resultSet.getBoolean("visibility"));
                diary.setTitle(resultSet.getString(6));
                diary.setFavourite(resultSet.getBoolean(7));
                list.add(diary);
            }
        } catch (Exception ex) {
            return list;
        }
        return list;
    }
    
    public List<Diary> getFavourite(Integer index) {
        List<Diary> list = new ArrayList<>();
        if (index == null) {
            return list;
        }
        String query = "SELECT * FROM diary WHERE visibility = 1 and user_id  = ? and favourite = 1 ORDER BY diary_id DESC";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, index.intValue());
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                Diary diary = new Diary();
                diary.setId(resultSet.getInt("diary_id"));
                diary.setUserId(resultSet.getInt("user_id"));
                diary.setDateOfDiary(resultSet.getDate("date_of_diary"));
                diary.setContent(resultSet.getString("content"));
                diary.setVisibility(resultSet.getBoolean("visibility"));
                diary.setTitle(resultSet.getString(6));
                diary.setFavourite(resultSet.getBoolean(7));
                list.add(diary);
            }
        } catch (Exception ex) {
            return list;
        }
        return list;
    }
}
