package listeners;

import connection.DatabaseConnection;
import dao.*;
import service.ArticleService;
import service.CommentService;
import service.UserService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
@WebListener
public class InitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        ArticleService articleService = new ArticleService();
        UserService userService = new UserService();
        CommentService commentService = new CommentService();

        ArticleDao articleDao = new ArticleDao();
        ArticleLikeDao articleLikeDao = new ArticleLikeDao();
        CommentDao commentDao = new CommentDao();
        CommentLikeDao commentLikeDao = new CommentLikeDao();
        FriendDao friendDao = new FriendDao();
        UserDao userDao = new UserDao();


        sce.getServletContext().setAttribute("articleService", articleService);
        sce.getServletContext().setAttribute("userService", userService);
        sce.getServletContext().setAttribute("commentService", commentService);

        sce.getServletContext().setAttribute("articleDao", articleDao);
        sce.getServletContext().setAttribute("articleLikeDao", articleLikeDao);
        sce.getServletContext().setAttribute("commentDao", commentDao);
        sce.getServletContext().setAttribute("commentLikeDao", commentLikeDao);
        sce.getServletContext().setAttribute("friendDao", friendDao);
        sce.getServletContext().setAttribute("userDao", userDao);
    }
}
