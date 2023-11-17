package dto;

import entities.User;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;

public class UserDto {
    private int userId;
    private String username;
    private String mail;
    private String password;
    private String firstName;
    private String lastName;
    private String country;
    private String city;
    private String profilePicture;
    private boolean female;
    private Date dateOfBirth;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public boolean isFemale() {
        return female;
    }

    public void setFemale(boolean female) {
        this.female = female;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public UserDto(User user) {
        this.userId = user.getUserId();
        this.username = user.getUsername();
        this.mail = user.getMail();
        this.password = user.getPassword();
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.country = user.getCountry();
        this.city = user.getCity();
        this.profilePicture = user.getProfilePicture();
        this.female = user.isFemale();
        this.dateOfBirth = user.getDateOfBirth();
    }
    private int calculateAge(java.util.Date dateOfBirth) {
        java.util.Date utilDate = new java.util.Date(dateOfBirth.getTime());

        LocalDate birthDate = utilDate.toInstant().atZone(Calendar.getInstance().getTimeZone().toZoneId()).toLocalDate();

        LocalDate currentDate = LocalDate.now();

        Period period = Period.between(birthDate, currentDate);

        return period.getYears();
    }
}
