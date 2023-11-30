package servlets;

import entities.User;
import service.UserService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        userService = (UserService) config.getServletContext().getAttribute("userService");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("ftl/registration.ftl").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        String firstName = req.getParameter("first_name");
        if (firstName == null || firstName.isEmpty()) {
            firstName = "Unknown";
        }

        String lastName = req.getParameter("last_name");
        if (lastName == null || lastName.isEmpty()) {
            lastName = "Unknown";
        }

        String dateOfBirthString = req.getParameter("date_of_birth");
        Date dateOfBirth = (dateOfBirthString == null || dateOfBirthString.isEmpty())
                ? new Date(System.currentTimeMillis())
                : Date.valueOf(dateOfBirthString);

        String gender = req.getParameter("gender");
        if (gender == null || gender.isEmpty()) {
            gender = "female";
        }

        String country = req.getParameter("country");
        if (country == null || country.isEmpty()) {
            country = "Unknown";
        }

        String city = req.getParameter("city");
        if (city == null || city.isEmpty()) {
            city = "Unknown";
        }

        User user = new User(username, email, password, firstName, lastName, country, city, "", gender.equalsIgnoreCase("female"), dateOfBirth);

        userService.insert(user);

        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
