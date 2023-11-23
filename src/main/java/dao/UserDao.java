package dao;

import connection.DatabaseConnection;
import entities.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements Dao<User>{
    private final Connection connection = DatabaseConnection.getConnection();

    @Override
    public User getById(int id) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSetToUser(resultSet);
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            String sql = "SELECT * from users";

            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                User user = resultSetToUser(resultSet);

                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return users;
    }

    @Override
    public void insert(User user) {
        try {
            String sql = "insert into users(" +
                    "user_name, " +
                    "mail, " +
                    "password, " +
                    "first_name, " +
                    "last_name, " +
                    "country, " +
                    "city, " +
                    "profile_picture, " +
                    "female, " +
                    "date_of_birth" +
                    ") values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            saveUserData(user, sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void update(User user) {
        updateMainInfo(user);
        updatePassword(user);
        updateProfilePicture(user);
    }

    @Override
    public void delete(User user) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, user.getUserId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private User resultSetToUser(ResultSet resultSet) throws SQLException {
        int userId = resultSet.getInt("user_id");
        String username = resultSet.getString("user_name");
        String email = resultSet.getString("mail");
        String password = resultSet.getString("password");
        String firstName = resultSet.getString("first_name");
        String lastName = resultSet.getString("last_name");
        String country = resultSet.getString("country");
        String city = resultSet.getString("city");
        String profilePicture = resultSet.getString("profile_picture");
        boolean female = resultSet.getBoolean("female");
        Date dateOfBirth = resultSet.getDate("date_of_birth");

        return new User(userId, username, email, password, firstName, lastName, country, city, profilePicture, female, dateOfBirth);
    }
    private void saveUserData(User user, String sql) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getMail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getFirstName());
            statement.setString(5, user.getLastName());
            statement.setString(6, user.getCountry());
            statement.setString(7, user.getCity());
            statement.setString(8, user.getProfilePicture());
            statement.setBoolean(9, user.isFemale());
            statement.setDate(10, user.getDateOfBirth());


            statement.executeUpdate();
        }
    }
    public void updateMainInfo(User user) {
        String sql = "UPDATE users " +
                "SET user_name = ?, " +
                "mail = ?, " +
                "first_name = ?, " +
                "last_name = ?, " +
                "country = ?, " +
                "city = ?, " +
                "female = ?, " +
                "date_of_birth = ?;";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getMail());
            statement.setString(3, user.getFirstName());
            statement.setString(4, user.getLastName());
            statement.setString(5, user.getCountry());
            statement.setString(6, user.getCity());
            statement.setBoolean(7, user.isFemale());
            statement.setDate(8, user.getDateOfBirth());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updatePassword(User user) {
        String sql = "UPDATE users " +
                "SET password = ? " +
                "WHERE user_id = ?;";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getPassword());
            statement.setInt(2, user.getUserId());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateProfilePicture(User user) {
        String sql = "UPDATE users " +
                "SET profile_picture = ? " +
                "WHERE user_id = ?;";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getProfilePicture());
            statement.setInt(2, user.getUserId());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
