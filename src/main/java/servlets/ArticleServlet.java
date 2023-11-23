package servlets;

import com.google.gson.Gson;
import dao.ArticleDao;
import dao.ArticleLikeDao;
import dao.CommentDao;
import dao.CommentLikeDao;
import dto.ArticleDto;
import dto.CommentDto;
import entities.Article;
import entities.Comment;
import entities.ArticleLike;
import entities.CommentLike;
import org.cloudinary.json.JSONObject;
import service.ArticleService;
import service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Comparator;
import java.util.List;

import static servlets.MenuServlet.findUserIdInCookie;

@WebServlet("/article")
public class ArticleServlet  extends HttpServlet {
    private ArticleDao articleDao;
    private Article currentArticle;
    private CommentService commentService;
    private int articleId;
    private int userId;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");

        articleDao = new ArticleDao();
        commentService = new CommentService(userId);
        ArticleService service = new ArticleService();

        currentArticle = articleDao.getByTitle(title);
        currentArticle.setViews(currentArticle.getViews() + 1);
        articleDao.update(currentArticle);
        ArticleDto articleDto = service.getById(currentArticle.getArticleId());


        articleId = articleDao.findArticleId(currentArticle.getSummary());
        userId = findUserIdInCookie(req);

        ArticleLikeDao likeDao = new ArticleLikeDao();
        boolean isArticleLiked = likeDao.isArticleLiked(new ArticleLike(userId,articleId));

        List<CommentDto> comments = commentService.getAllCommentsForArticle(articleId);
        comments.sort(Comparator.comparing(CommentDto::getSendingTime));

        req.setAttribute("article", articleDto);
        req.setAttribute("comments", comments);
        req.setAttribute("isArticleLiked", isArticleLiked);

        req.getRequestDispatcher("ftl/article.ftl").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("articleLike".equals(action)) {
            sendArticleLike(resp);
        } else if ("comment".equals(action)) {
            sendComment(req, resp);
        } else if ("commentLike".equals(action)) {
            sendCommentLike(req, resp);
        }
    }


    private void sendArticleLike(HttpServletResponse resp) throws IOException {
        ArticleLikeDao likeDao = new ArticleLikeDao();
        ArticleLike like = new ArticleLike(userId, articleId);

        boolean isArticleLiked = likeDao.isArticleLiked(like);

        if (isArticleLiked) {
            likeDao.delete(like);
        } else {
            likeDao.insert(like);
        }

        int count = likeDao.getLikesCount(articleId);
        currentArticle.setLikes(count);
        articleDao.update(currentArticle);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Создайте объект JSON для отправки
        JSONObject responseJSON = new JSONObject();
        responseJSON.put("likesCount", count);
        responseJSON.put("isArticleLiked", !isArticleLiked);

        resp.getWriter().print(responseJSON);

    }

    private void sendComment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String commentText = req.getParameter("comment");

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());

        Comment comment = new Comment(commentText, currentTime, userId, articleId);
        commentService.insert(comment);

        CommentDao commentDao = new CommentDao();

        int commentId = commentDao.findCommentId(commentText, currentTime);

        CommentDto commentDto = commentService.getById(commentId);

        Gson gson = new Gson();
        String jsonResponse = gson.toJson(commentDto);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        out.print(jsonResponse);
        out.close();
    }



    private void sendCommentLike(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int commentId = Integer.parseInt(req.getParameter("commentId"));

        CommentLikeDao likeDao = new CommentLikeDao();
        CommentDao commentDao = new CommentDao();
        CommentLike like = new CommentLike(userId, commentId);
        Comment comment = commentDao.getById(commentId);

        boolean isCommentLiked = likeDao.isCommentLiked(like);

        if (isCommentLiked) {
            likeDao.delete(like);
        } else {
            likeDao.insert(like);
        }

        int count = likeDao.getLikesCount(commentId);
        comment.setLikes(count);
        commentDao.update(comment);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Создайте объект JSON для отправки
        JSONObject responseJSON = new JSONObject();
        responseJSON.put("likesCount", count);
        responseJSON.put("isCommentLiked", !isCommentLiked);

        resp.getWriter().print(responseJSON);
    }
}
