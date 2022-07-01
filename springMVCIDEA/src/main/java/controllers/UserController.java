package controllers;

import myexceptions.LoginExceptino;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
    @RequestMapping("/login.do")
    public String login() {
        return "login_12_3_5.jsp";
    }

    @RequestMapping(value = "/dologincheck.do")
    public String dologincheck() {
        return "usercheck_12_4.jsp";
    }


    @RequestMapping("/register.do")
    public String register() {
        return "/WEB-INF/jsp/register.jsp";
    }

    @RequestMapping("/wrongflag.do")
    public String wrongflag() {
        return "/WEB-INF/jsp/wrongflag.jsp";
    }

    //异常处理
    @RequestMapping("/login.do?wrongflag=true")
    public String loginwrongflag(String wrongflag) throws Exception {

//        ModelAndView mv = new ModelAndView();
        if (!wrongflag.equals("true")) throw new LoginExceptino("用户名和密码不对");
        {
////        if (password.length() < 3) throw new PasswordException("密码长度太小！");
////        if (password.length() > 10) throw new Exception("测试其他异常，跳转到其他页面！");
//            mv.addObject("wrongflag", wrongflag);
////        mv.addObject("password", password);
//            mv.setViewName("info1");
//            return mv;
            return wrongflag();

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

}
//wrongflag
