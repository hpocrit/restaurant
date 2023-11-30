package service;

import dao.CommentDao;
import dao.CommentLikeDao;
import dao.UserDao;
import dto.CommentDto;
import entities.Comment;
import entities.CommentLike;
import entities.User;

import java.util.ArrayList;
import java.util.List;

public class CommentService implements Service<Comment, CommentDto> {
    CommentDao commentDao = new CommentDao();
    UserDao userDao = new UserDao();

    private int currentUserId;

    public CommentService() {}

    public CommentService(int currentUserId) {
        this.currentUserId = currentUserId;
    }

    @Override
    public List<CommentDto> getAll() {
        List<Comment> comments = commentDao.getAll();
        List<CommentDto> commentsDto = new ArrayList<>();

        for (Comment comment : comments) {
            commentsDto.add(commentToCommentDto(comment));
        }

        return commentsDto;
    }


    @Override
    public CommentDto getById(int id) {
        return commentToCommentDto(commentDao.getById(id));
    }

    private CommentDto commentToCommentDto(Comment comment) {
        CommentLikeDao likeDao = new CommentLikeDao();
        User author = userDao.getById(comment.getAuthorId());

        return new CommentDto(
                comment.getText(),
                comment.getSendingTime(),
                comment.getLikes(),
                comment.getCommentId(),
                author.getUserId(),
                author.getUsername(),
                author.getProfilePicture(),
                comment.getArticleId(),
                likeDao.isCommentLiked(new CommentLike(currentUserId, comment.getCommentId())));
    }

    @Override
    public void insert(Comment comment) {
        commentDao.insert(comment);
    }

    @Override
    public void update(Comment comment) {
        commentDao.update(comment);
    }

    @Override
    public void delete(Comment comment) {
        commentDao.delete(comment);
    }

    public List<CommentDto> getAllCommentsForArticle(int articleId) {
        List<CommentDto> allComments = getAll();
        List<CommentDto> result = new ArrayList<>();

        for (CommentDto comment: allComments) {
            if (comment.getArticleId() == articleId) result.add(comment);
        }

        return result;
    }
}
