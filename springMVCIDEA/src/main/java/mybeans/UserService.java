package mybeans;

import java.util.*;

public class UserService{
    List<UserBean> users = new ArrayList<UserBean>();
    public List<UserBean> getUsers(){
        int id = 1;
        String username = "张无忌";
        String password = "123456";
        boolean  gender= true;
        String married = "是";
        int age = 18;
        List<String> myInteresting = new ArrayList<String>();
        myInteresting.add("音乐");
        myInteresting.add("旅游");
        String city = "深圳";
        String graduated = "硕士";
        String description = username + "的个人简介";
        UserBean user1 = new UserBean(id, username, password, gender, married, age, myInteresting, city, graduated, description);
        id = 2;
        username = "李寻欢";
        password = "111111";
        gender = false;
        married = "否";
        age = 19;
        myInteresting = new ArrayList<String>();
        myInteresting.add("运动");
        myInteresting.add("唱歌");
        city = "北京";
        graduated = "本科";
        description = username + "的个人简介";
        UserBean user2 = new UserBean(id, username, password, gender, married, age, myInteresting, city, graduated, description);
        id =3;
        username = "黄飞鸿";
        password = "888888";
        gender = false;
        married = "是";
        age = 22;
        myInteresting = new ArrayList<String>();
        myInteresting.add("美食");
        myInteresting.add("音乐");
        city = "广州";
        graduated = "博士";
        description = username + "的个人简介";
        UserBean user3 = new UserBean(id, username, password, gender, married, age, myInteresting, city, graduated, description);
        users.add(user1);
        users.add(user2);
        users.add(user3);
        return users;
    }
    public UserBean getUserById(int id){
        users = getUsers();
        return users.get(id-1);
    }
}
