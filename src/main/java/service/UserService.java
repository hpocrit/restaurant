package service;

import dao.UserDao;
import dto.UserDto;
import entities.User;
import utils.PasswordUtil;
import java.util.List;
import java.util.stream.Collectors;

public class UserService implements Service<User, UserDto>{
    private final UserDao dao = new UserDao();

    @Override
    public List<UserDto> getAll() {
        return dao.getAll().stream().map(UserDto::new).collect(Collectors.toList());
    }

    @Override
    public UserDto getById(int id) {
        User user = dao.getById(id);
        return new UserDto(user);
    }

    @Override
    public void insert(User user) {
        user.setPassword(PasswordUtil.encrypt(user.getPassword()));
        dao.insert(user);
    }

    @Override
    public void update(User user) {
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            user.setPassword(PasswordUtil.encrypt(user.getPassword()));
            dao.updatePassword(user);
        }
        if (user.getProfilePicture() != null && !user.getProfilePicture().isEmpty()) {
            dao.updateProfilePicture(user);
        }
        if (user.getUsername() != null && !user.getUsername().isEmpty()) {
            dao.updateMainInfo(user);
        }
    }

    @Override
    public void delete(User user) {
        dao.delete(user);
    }
}
