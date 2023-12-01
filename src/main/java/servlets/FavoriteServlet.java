package servlets;

import dao.ArticleDao;
import dao.ArticleLikeDao;
import dto.ArticleDto;
import entities.Article;
import entities.ArticleLike;
import service.ArticleService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {
    private ArticleService articleService;
    private ArticleLikeDao articleLikeDao;
    private ArticleDao articleDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        articleService = (ArticleService) config.getServletContext().getAttribute("articleService");
        articleLikeDao = (ArticleLikeDao) config.getServletContext().getAttribute("articleLikeDao");
        articleDao = (ArticleDao) config.getServletContext().getAttribute("articleDao");
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ArticleLike> articlesLikes = articleLikeDao.getByUserId(findUserIdInCookie(req));   
        List<Article> articlesDto = null;
        for (ArticleLike art: articlesLikes) {
            articlesDto.add(articleDao.getById(art.getArticleId()));
        }
        

        req.setAttribute("all_news", articlesDto);

        req.getRequestDispatcher("ftl/favorite.ftl").forward(req, resp);
    }

    static int findUserIdInCookie(HttpServletRequest req) {
        int userId = -1;

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_id")) {
                    return Integer.parseInt(cookie.getValue());
                }
            }
        }
        return userId;
    }
}
