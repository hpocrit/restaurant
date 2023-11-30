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
import service.UserService;

import javax.servlet.ServletConfig;
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
    private ArticleLikeDao articleLikeDao;
    private CommentDao commentDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        articleDao = (ArticleDao) config.getServletContext().getAttribute("articleDao");
        commentService = (CommentService) config.getServletContext().getAttribute("commentService");
        articleLikeDao = (ArticleLikeDao) config.getServletContext().getAttribute("articleLikeDao");
        commentDao = (CommentDao) config.getServletContext().getAttribute("commentDao");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");

        commentService = new CommentService(userId);
        ArticleService service = new ArticleService();

        currentArticle = articleDao.getByTitle(title);
        currentArticle.setViews(currentArticle.getViews() + 1);
        articleDao.update(currentArticle);
        ArticleDto articleDto = service.getById(currentArticle.getArticleId());


        articleId = articleDao.findArticleId(currentArticle.getSummary());
        userId = findUserIdInCookie(req);

        boolean isArticleLiked = articleLikeDao.isArticleLiked(new ArticleLike(userId,articleId));

        List<CommentDto> comments = commentService.getAllCommentsForArticle(articleId);
        comments.sort(Comparator.comparing(CommentDto::getSendingTime));

        req.setAttribute("article", articleDto);
        req.setAttribute("comments", comments);
        req.setAttribute("isArticleLiked", isArticleLiked);

        req.getRequestDispatcher("ftl/article.ftl").forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        sendArticleLike(resp);

        sendComment(req, resp);

        sendCommentLike(req, resp);



        resp.sendRedirect(req.getContextPath() + "/article?title=" + currentArticle.getTitle());
    }


    private void sendArticleLike(HttpServletResponse resp) throws IOException {
        ArticleLike like = new ArticleLike(userId, articleId);

        boolean isArticleLiked = articleLikeDao.isArticleLiked(like);

        if (isArticleLiked) {
            articleLikeDao.delete(like);
        } else {
            articleLikeDao.insert(like);
        }

        int count = articleLikeDao.getLikesCount(articleId);
        currentArticle.setLikes(count);
        articleDao.update(currentArticle);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Создайте объект JSON для отправки
//        JSONObject responseJSON = new JSONObject();
//        responseJSON.put("likesCount", count);
//        responseJSON.put("isArticleLiked", !isArticleLiked);
//
//        resp.getWriter().print(responseJSON);

    }

    private void sendComment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String commentText = req.getParameter("comment");
        if(commentText != null) {
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());

            Comment comment = new Comment(commentText, currentTime, userId, articleId);
            commentService.insert(comment);

            int commentId = commentDao.findCommentId(commentText, currentTime);


//            Gson gson = new Gson();
//            String jsonResponse = gson.toJson(commentDto);
//
//            resp.setContentType("application/json");
//            resp.setCharacterEncoding("UTF-8");
//
//            PrintWriter out = resp.getWriter();
//            out.print(jsonResponse);
//            out.close();
        }
    }



    private void sendCommentLike(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String a = req.getParameter("commentId");
        if(a != null) {
            int commentId = Integer.parseInt(a);
            CommentLikeDao likeDao = new CommentLikeDao();
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

//            resp.setContentType("application/json");
//            resp.setCharacterEncoding("UTF-8");
//
//            // Создайте объект JSON для отправки
//            JSONObject responseJSON = new JSONObject();
//            responseJSON.put("likesCount", count);
//            responseJSON.put("isCommentLiked", !isCommentLiked);
//
//            resp.getWriter().print(responseJSON);
        }
    }
}
