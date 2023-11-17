package dao;

import connection.DatabaseConnection;
import entities.Article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDao implements Dao<Article>{
    Connection connection = DatabaseConnection.getConnection();

    @Override
    public Article getById(int id) {
        String sql = "SELECT * FROM articles WHERE article_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSetToArticle(resultSet);
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Article> getAll() {
        List<Article> articleList = new ArrayList<>();
        String sql = "SELECT * FROM articles";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                articleList.add(resultSetToArticle(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return articleList;
    }

    @Override
    public void insert(Article article) {
        String sql = "INSERT INTO articles " +
                "(title, " +
                "summary, " +
                "price_s, " +
                "price_l, " +
                "category, " +
                "image_url, " +
                "views, " +
                "likes) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            saveArticleData(article, statement);

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Article article) {
        String sql = "UPDATE articles SET title = ?, summary = ?, price_s = ?, price_l = ?, category = ?, image_url = ?, views = ?, likes = ? WHERE article_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            saveArticleData(article, statement);
            statement.setInt(9, article.getArticleId());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(Article article) {
        String sql = "DELETE FROM articles WHERE article_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, article.getArticleId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private Article resultSetToArticle(ResultSet resultSet) throws SQLException {
        return new Article(
                resultSet.getInt("article_id"),
                resultSet.getString("title"),
                resultSet.getString("summary"),
                resultSet.getInt("price_s"),
                resultSet.getInt("price_l"),
                resultSet.getString("category"),
                resultSet.getString("image_url"),
                resultSet.getInt("views"),
                resultSet.getInt("likes")
        );
    }
    public Article getByTitle(String title) {
        String sql = "SELECT * FROM articles WHERE title = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, title);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSetToArticle(resultSet);
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private void saveArticleData(Article article, PreparedStatement statement) throws SQLException {
        statement.setString(1, article.getTitle());
        statement.setString(2, article.getSummary());
        statement.setInt(3, article.getPrice_s());
        statement.setInt(4, article.getPrice_l());
        statement.setString(5, article.getCategory());
        statement.setString(6, article.getImageUrl());
        statement.setInt(7, article.getViews());
        statement.setInt(8, article.getLikes());
    }
}
