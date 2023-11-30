package dao;

import entities.Friend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static connection.DatabaseConnection.getConnection;


public class FriendDao implements Dao<Friend> {
    private Connection connection = getConnection();

    @Override
    public Friend getById(int id) {
        return null;
    }

    @Override
    public List<Friend> getAll() {
        List<Friend> likes = new ArrayList<>();
        String sql = "SELECT * FROM friends";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                likes.add(resultSetToFriend(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return likes;
    }

    @Override
    public void insert(Friend friend) {
        if (!isFriendAdded(friend)) {
            String sql = "INSERT INTO friends (user_id, friend_id) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, friend.getUserId());
                statement.setInt(2, friend.getFriendId());

                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public boolean isFriendAdded(Friend friend) {
        String sql = "SELECT * FROM friends WHERE user_id = ? and friend_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, friend.getUserId());
            statement.setInt(2, friend.getFriendId());
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            return false;
        }
    }

    @Override
    public void update(Friend friend) {
        insert(friend);
    }

    @Override
    public void delete(Friend friend) {
        String sql = "DELETE FROM friends WHERE user_id = ? and friend_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, friend.getUserId());
            statement.setInt(2, friend.getFriendId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Friend resultSetToFriend(ResultSet resultSet) throws SQLException {
        return new Friend(
                resultSet.getInt("user_id"),
                resultSet.getInt("friend_id")
        );
    }
}
