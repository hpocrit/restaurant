package entities;

public class CommentLike {
    private int userId;
    private int commentId;

    public CommentLike(int userId, int commentId) {
        this.userId = userId;
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }
}
