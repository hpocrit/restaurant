package servlets;

import com.cloudinary.Cloudinary;
import dao.UserDao;
import entities.User;
import service.UserService;

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        findUserIdInCookie(req);

        User user = new UserDao().getById(userId);
        req.setAttribute("user", user);

        req.getRequestDispatcher("ftl/profile.ftl").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        updateUserMainInfo(req);
        updatePassword(req);
        updateProfilePicture(req, resp);
    }

    private void updateUserMainInfo(HttpServletRequest req) {
        String username = req.getParameter("username");

        if (username == null || username.isEmpty()) {
            return;
        }

        String mail = req.getParameter("email");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        Date dateOfBirth = Date.valueOf(req.getParameter("dateOfBirth"));
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

        UserService service = new UserService();

        service.update(user);
    }

    private void updatePassword(HttpServletRequest req) {
        String password = req.getParameter("password");

        if (password == null || password.isEmpty()) {
            return;
        }

        User user = new User(userId);
        user.setPassword(password);
        UserService service = new UserService();
        service.update(user);
    }

    private void updateProfilePicture(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            Part profilePicture = req.getPart("profilePicture");
            String filename = Paths.get(profilePicture.getSubmittedFileName()).getFileName().toString();

            File file = File.createTempFile(FILE_NAME_PREFIX + File.separator + (filename.hashCode() % DIRECTORIES_COUNT) + File.separator + filename, "");

            InputStream content = profilePicture.getInputStream();
            file.getParentFile().mkdirs();
            file.createNewFile();
            FileOutputStream out = new FileOutputStream(file);
            byte[] buffer = new byte[content.available()];
            content.read(buffer);
            out.write(buffer);
            file.deleteOnExit();
            out.close();

            String profilePictureUrl = cloudinary.uploader().upload(file, new HashMap<>()).get("secure_url").toString();

            User user = new User(userId);
            user.setProfilePicture(profilePictureUrl);
            UserService service = new UserService();
            service.update(user);

            resp.setContentType("text/plain");
            resp.getWriter().write(profilePictureUrl);
        } catch (Exception ignored) {

        }
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
