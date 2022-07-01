package controllers;

import mybeans.UserBean;
import mybeans.UserService;
import myexceptions.LoginExceptino;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller

public class AdminController {
    @RequestMapping("/login.do")
    public String login() {
        return "/WEB-INF/jsp/login_12_3_5.jsp";
    }

    @RequestMapping(value = "/dologincheck.do")
    public String dologincheck() {
        return "/WEB-INF/jsp/usercheck_12_4.jsp";
    }


    @RequestMapping("/loginExceptiontest.do")
    public String loginExceptiontest() {
        return "/WEB-INF/jsp/loginExceptiontest.jsp";
    }

    @RequestMapping(value = "/dologincheckExceptiontest.do")
    public String dologincheckExceptiontest() {
        return "/WEB-INF/jsp/usercheckExceptiontest.jsp";
    }


    @RequestMapping("/register.do")
    public String register() {
        return "/WEB-INF/jsp/register.jsp";
    }

    @RequestMapping("/doregistercheck.do")
    public String doregistercheck() {
        return "/WEB-INF/jsp/registerCheck.jsp";
    }

    //异常处理
    @RequestMapping("/wrongflag.do")
    public ModelAndView loginwrongflag(String wrongflag) throws Exception {

        ModelAndView mv = new ModelAndView();
        if (!wrongflag.equals("true")) throw new LoginExceptino("用户名和密码不对");
        {
////        if (password.length() < 3) throw new PasswordException("密码长度太小！");
////        if (password.length() > 10) throw new Exception("测试其他异常，跳转到其他页面！");
            mv.addObject("wrongflag", wrongflag);
////        mv.addObject("password", password);
            mv.setViewName("wrongflag");
            return mv;
//            return "/WEB-INF/jsp/wrongflag.jsp";

        }
//        }
//        else if(){
////            return "/WEB-INF/jsp/wrongflag.jsp";
//            System.out.println("what");
//        }

    }


    @RequestMapping("/list.do")
    public ModelAndView list() {
        UserService userService = new UserService();
        List<UserBean> users = userService.getUsers();
        ModelAndView mv = new ModelAndView();
        mv.addObject("users", users);
        mv.setViewName("/WEB-INF/jsp/list.jsp");
        return mv;
    }

    @RequestMapping("/{id}/detail.do")
    public ModelAndView detail(@PathVariable int id) {
        List<String> allInteresting = new ArrayList<String>();
        allInteresting.add("舞蹈");
        allInteresting.add("旅游");
        allInteresting.add("唱歌");
        allInteresting.add("音乐");
        allInteresting.add("运动");
        allInteresting.add("美食");
        List<String> cities = new ArrayList<String>();
        cities.add("北京");
        cities.add("上海");
        cities.add("广州");
        cities.add("深圳");
        List<String> graduates = new ArrayList<String>();
        graduates.add("博士");
        graduates.add("硕士");
        graduates.add("本科");
        graduates.add("大专");
        UserService userService = new UserService();
        UserBean user = userService.getUserById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("allInteresting", allInteresting);
        mv.addObject("cities", cities);
        mv.addObject("graduates", graduates);
        mv.addObject("user", user);
        mv.setViewName("/WEB-INF/jsp/detail.jsp");
        return mv;

    }
}

//    @ExceptionHandler(NameException.class)
//    public ModelAndView HandleNameException(Exception ex) {
//        ModelAndView mv=new ModelAndView();
//        //do something;
//        mv.addObject("ex",ex);
//        mv.setViewName("nameError");
//        return mv;
//    }
//    @ExceptionHandler(PasswordException.class)
//    public ModelAndView HandlePasswordException(Exception ex) {
//        ModelAndView mv=new ModelAndView();
//        //do something;
//        mv.addObject("ex",ex);
//        mv.setViewName("passwordError");
//        return mv;
//    }
//    @ExceptionHandler
//    public ModelAndView HandleException(Exception ex) {
//        ModelAndView mv=new ModelAndView();
//        //do something;
//        mv.addObject("ex",ex);
//        mv.setViewName("defaultError");
//        return mv;
//    }

//wrongflag
