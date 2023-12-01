package servlets;

import com.cloudinary.Cloudinary;
import dao.UserDao;
import entities.User;
import service.UserService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.HashMap;

import static utils.CloudinaryUtil.getCloudinary;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private int userId;
    private static final int DIRECTORIES_COUNT = 100;
    private static final String FILE_NAME_PREFIX = "/tmp";
    private final Cloudinary cloudinary = getCloudinary();
    private UserDao userDao;
    private UserService userService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        userDao = (UserDao) config.getServletContext().getAttribute("userDao");
        userService = (UserService) config.getServletContext().getAttribute("userService");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        findUserIdInCookie(req);

        User user = userDao.getById(userId);
        req.setAttribute("user", user);

        req.getRequestDispatcher("ftl/profile.ftl").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        updateUserMainInfo(req);
        updatePassword(req);
//        updateProfilePicture(req, resp);
        resp.sendRedirect(req.getContextPath() + "/profile");
    }

    private void updateUserMainInfo(HttpServletRequest req) {
        String username = req.getParameter("username");

        if (username == null || username.isEmpty()) {
            return;
        }

        String mail = req.getParameter("mail");
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        Date dateOfBirth = Date.valueOf(req.getParameter("date_of_birth"));
        String gender = req.getParameter("gender");
        String country = req.getParameter("country");
        String city = req.getParameter("city");

        User user = new User(userId);
        user.setUsername(username);
        user.setMail(mail);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setDateOfBirth(dateOfBirth);
        user.setFemale(gender.equalsIgnoreCase("male"));
        user.setCountry(country);
        user.setCity(city);

        UserService service = userService;

        service.update(user);
    }

    private void updatePassword(HttpServletRequest req) {
        String password = req.getParameter("password");

        if (password == null || password.isEmpty()) {
            return;
        }

        User user = new User(userId);
        user.setPassword(password);
        UserService service = userService;
        service.update(user);
    }

    private void findUserIdInCookie(HttpServletRequest req) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_id")) {
                    userId = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
        }
    }
}
