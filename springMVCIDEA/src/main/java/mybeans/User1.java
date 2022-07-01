package mybeans;

public class User1 {
    String username;
    String password;
    Address address;

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Address getAddress() {
        return address;
    }

    public void setUsername(String name) {
        username = name;
    }

    public void setPassword(String pwd) {
        password = pwd;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
