package listeners;

import connection.DatabaseConnection;
import service.ArticleService;
import service.UserService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;

public class InitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        Connection databaseConnection = DatabaseConnection.getConnection();

        ArticleService articleService = new ArticleService();
        UserService userService = new UserService();

        sce.getServletContext().setAttribute("articleService", articleService);
        sce.getServletContext().setAttribute("userService", userService);



    }
}
