package servlets;

import dao.FriendDaoImpl;
import dto.UserDto;
import entities.Friend;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static servlets.MenuServlet.findUserIdInCookie;

@WebServlet(name = "userInfoServlet", urlPatterns = "/user")
public class UserInfoServlet extends HttpServlet {
    FriendDaoImpl friendDao;
    int currUserId, friendId;

    Friend friend;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        currUserId = findUserIdInCookie(req);
        friendId = Integer.parseInt(req.getParameter("userId"));
        if (currUserId == friendId) {
            resp.sendRedirect("/profile");
            return;
        }

        friendDao = new FriendDaoImpl();

        friend = new Friend(currUserId, friendId);

        UserDto userDto = new UserService().getById(friendId);
        boolean isFriendAdded = friendDao.isFriendAdded(friend);

        req.setAttribute("user", userDto);
        req.setAttribute("isFriendAdded", isFriendAdded);

        req.getRequestDispatcher("ftl/user_info.ftl").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean isFriendAdded = friendDao.isFriendAdded(friend);

        if (isFriendAdded) {
            friendDao.delete(friend);
        } else {
            friendDao.insert(friend);
        }

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(String.valueOf(!isFriendAdded));
    }
}
