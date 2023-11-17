package servlets;

import dto.ArticleDto;
import service.ArticleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// TODO: 15.11.2023 соединить с ftl

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ArticleDto> articlesDto = new ArticleService().getAll();
        articlesDto.sort((o1, o2) -> o2.getViews() - o1.getViews());


        ArticleDto mostViewed = articlesDto.remove(0);

        req.setAttribute("mostViewed", mostViewed);
        req.setAttribute("all_news", articlesDto);

        req.getRequestDispatcher("ftl/menu.ftl").forward(req, resp);
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
