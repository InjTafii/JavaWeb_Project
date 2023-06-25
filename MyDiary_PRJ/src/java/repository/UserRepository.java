package repository;


import contracts.IRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.User;
import util.Helper;

public class UserRepository implements IRepository<User, Integer> {

    private final Connection database;

    public UserRepository(Connection database) {
        this.database = database;
    }

    @Override
    public User get(Integer index) {
        User user = null;
        String query = "SELECT * FROM [user] WHERE user_id = ?";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, index);
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
            }
        } catch (Exception e) {
            return user;
        }
        return user;
    }

    @Override
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM [user] "
                + "ORDER BY user_id ASC";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                list.add(user);
            }
        } catch (Exception ex) {
            return list;
        }
        return list;
    }

    @Override
    public boolean add(User user) {
        boolean result = false;
        String query = "INSERT INTO [user]"
                + " VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setString(1, user.getFirstName());
            ptm.setString(2, user.getLastName());
            ptm.setString(3, user.getEmail());
            ptm.setString(4, user.getPassword());
            ptm.executeUpdate();
            result = true;
        } catch (Exception ex) {
            return result;
        }
        return result;
    }

    @Override
    public User update(Integer index, User user) {
        User updatedUser = get(index);
        String query = "UPDATE [user] SET "
                + "firstName = ?, "
                + "lastName = ?, "
                + "email = ?, "
                + "password = ? "
                + "WHERE user_id = ?";

        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setString(1, user.getFirstName());
            ptm.setString(2, user.getLastName());
            ptm.setString(3, user.getEmail());
            ptm.setString(4, user.getPassword());
            ptm.setInt(5, user.getId());
            ptm.executeUpdate();
            Boolean result = true;
            updatedUser = result ? updatedUser : user;
        } catch (Exception ex) {
            return updatedUser;
        }
        return updatedUser;
    }

    @Override
    public User remove(Integer index) {
        String query = "DELETE FROM [user] WHERE user_id = ?";
        User deletedUser = get(index);
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setInt(1, index);
            ptm.executeUpdate();
        } catch (Exception ex) {
            return deletedUser;
        }
        return deletedUser;
    }

    public User login(String email, String password) {
        User user = null;
        String query = "SELECT * FROM [user] "
                + "WHERE email = ? "
                + "AND password = ?";
        try {
            PreparedStatement ptm = database.prepareStatement(query);
            ptm.setString(1, email);
            ptm.setString(2, Helper.md5(password));
            ResultSet resultSet = ptm.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
            }
        } catch (Exception e) {
            return user;
        }
        return user;
    }

}
