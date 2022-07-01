package mybeans;

import java.util.*;
public class UserBean{
    public int id;
    public String username;
    public String password;
    public boolean gender;
    public String married;
    public int age;
    public List<String> myInteresting;
    public String city;
    public String graduated;
    public String description;
    public UserBean(){}
    public UserBean(int id, String username, String password, boolean gender, String married, int age, List<String> myInteresting,String city,String graduated,String description){
        this.id = id;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.married = married;
        this.age = age;
        this.myInteresting = myInteresting;
        this.city = city;
        this.graduated = graduated;
        this.description = description;
    }
    public int getId(){return id;}
    public String getUsername(){return username;}
    public String getPassword(){return password;}
    public boolean getGender(){return gender;}
    public String getMarried(){return married;}
    public int getAge(){return age;}
    public List<String> getMyInteresting(){return myInteresting;}
    public String getCity(){return city;}
    public String getGraduated(){return graduated;}
    public String getDescription(){return description;}
    public void setId(int id) {this.id=id;}
    public void setUsername(String username) {this.username=username;}
    public void setPassword(String password) {this.password=password;}
    public void setGender(boolean gender) {this.gender=gender;}
    public void setMarried(String married) {this.married=married;}
    public void setAge(int age) {this.age=age;}
    public void setMyInteresting(List<String> myInteresting) {this.myInteresting=myInteresting;}
    public void setCity(String city) {this.city=city;}
    public void setGraduated(String graduated) {this.graduated=graduated;}
    public void setDescription(String description) {this.description=description;}
}
