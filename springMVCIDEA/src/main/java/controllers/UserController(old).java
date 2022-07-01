////package controllers;
////
////import org.springframework.stereotype.Controller;
////import org.springframework.web.bind.annotation.RequestMapping;
////
////
////@Controller
////public class UserController {
////    @RequestMapping("/login.do")
////    public String login() {
////        return "login";
////    }
////
////    @RequestMapping("/register.do")
////    public String register() {
////        return "register";
////    }
////}
//
//
//// 控制器类AdminController和UserController中的@RequestMapping注解相同，
//// 那么浏览器发出“/login.do”请求时就会产生冲突。
//// 解决办法是在各自的类上再加上一个@RequestMapping注解，且每个类注解的名称不同。
//// @RequestMapping("/user")
//
////package controllers;
////
////import org.springframework.stereotype.Controller;
////import org.springframework.web.bind.annotation.RequestMapping;
////
////
////@Controller
////@RequestMapping("/user")
////public class UserController {
////    @RequestMapping("/login.do")
////    public String login() {
////        return "login";
////    }
////
////    @RequestMapping("/register.do")
////    public String register() {
////        return "register";
////    }
////}
//
//
////在资源路径中使用通配符，可以匹配灵活多变的URL请求，映射到同一个控制器方法进行响应，有两种用法：路径级数的精确匹配、路径级数的可变匹配。
/////user/*/login.do：表示在login.do的资源名称前面，限定只能有两级路径，第一级路径必须是/user，第二级路径随意，称为路径级数的精确匹配。
/////user/**/login.do：表示在login.do的资源名称前面，必须以/user路径开头，而其他级路径可有可无，若有，包含几级，各级叫什么名称，都随意，称为路径级数的可变匹配。
//
//// 通配符
////package controllers;
////
////import org.springframework.stereotype.Controller;
////import org.springframework.web.bind.annotation.RequestMapping;
////
////@Controller
////@RequestMapping("/user")
////public class UserController {
////    @RequestMapping("/*/login.do")
////    public String login() {
////        return "login";
////    }
////
////    @RequestMapping("/**/register.do")
////    public String register() {
////        return "register";
////    }
////}
//package controllers;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.bind.annotation.RequestParam;
//import mybeans.*;
//import org.springframework.web.bind.annotation.PathVariable;
//import myexceptions.*;
//
//import javax.servlet.http.*;
//
//import org.springframework.ui.Model;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//import org.springframework.web.servlet.HandlerExceptionResolver;
//
//@Controller
//@RequestMapping("/user")
////public class UserController {
////    @RequestMapping("/*/login.do")
////    public String login() {
////        return "login";
////    }
////
////    @RequestMapping("/**/register.do")
////    public String register() {
////        return "register";
////    }
//
//public class UserController {
//    @RequestMapping("/login.do")
//    public String login() {
//        return "login";
//    }
//
//    @RequestMapping("/register.do")
//    public String register() {
//        return "register";
//    }
//
////    @Override
////    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
////        ModelAndView mv = new ModelAndView();
////        mv.addObject("ex", ex);
////        mv.setViewName("forward:/defaultError.jsp");
////        if (ex instanceof NameException) {
////            //do something;
////            mv.setViewName("forward:/passwordError.jsp");
////        }
////        if (ex instanceof PasswordException) {
////            //do something;
////            mv.setViewName("forward:/passwordError.jsp");
////        }
////        return mv;
////    }
//    //    @RequestMapping("/dologin.do")
////    public ModelAndView doLogin(String username, String password) {
////        ModelAndView mv = new ModelAndView();
////        if (username.equals("admin") && password.equals("123")) {
////            mv.addObject("user", "admin");
////            mv.setViewName("success");
////        } else
////            mv.setViewName("fail");
////        return mv;
////    }
//    //http://localhost:8080/springMVCIDEA_war/user/dologin.do打不开
//    //http://localhost:8080/springMVCIDEA_war/user/login.do可以打开，从这里跳转到dologin.do
//    //http://localhost:8080/springMVCIDEA_war/user/dologin.do?username=1&password=2可以打开（登陆失败）
////    @RequestMapping("/dologin.do")
////    public ModelAndView doLogin(@RequestParam("username") String uname, @RequestParam("password") String pwd) {
////        ModelAndView mv = new ModelAndView();
////        if (uname.equals("admin") && pwd.equals("123")) {
////            mv.addObject("user", "admin");
////            mv.setViewName("success");
////        } else {
////            mv.setViewName("fail");
////        }
////        return mv;
////    }
////    @RequestMapping("/dologin.do")
////    public ModelAndView doLogin(User user) {
////        ModelAndView mv = new ModelAndView();
////        if ("admin".equals(user.getUsername()) && "123".equals(user.getPassword())) {
////            mv.addObject("user", "admin");
////            mv.setViewName("success");
////        } else {
////            mv.setViewName("fail");
////        }
////        return mv;
////    }
////    @RequestMapping("/dologin.do")
////    public ModelAndView doLogin(HttpServletRequest request) {
////        String username = request.getParameter("username");
////        String password = request.getParameter("password");
////        ModelAndView mv = new ModelAndView();
////        if (username.equals("admin") && password.equals("123")) {
////            mv.addObject("user", "admin");
////            mv.setViewName("success");
////        } else
////            mv.setViewName("fail");
////        return mv;
////    }
////    @RequestMapping("/dologin.do")
////    public String doLogin(User user, Model model) {
////        model.addAttribute("user", user);
////        return "forward:second2.do";
////    }
////    @RequestMapping("/dologin.do")
////    public String doLogin(User user, HttpServletRequest request) {
////        if (user.getUsername().equals("张三") && user.getPassword().equals("123")) {
////            request.setAttribute("user", user.getUsername());
////            return "success";
////        } else
////            return "login";
////    }
//
//    //    @RequestMapping("/dologin.do")
////    public String doLogin(User user, HttpSession session) {
////        if (user.getUsername().equals("张三") && user.getPassword().equals("123")) {
////            session.setAttribute("user", user.getUsername());
////            return "success";
////        } else
////            return "login";
////    }
////    @RequestMapping("/dologin.do")
////    public String doLogin(User user, Model model) {
////        model.addAttribute("username", user.getUsername());
////        model.addAttribute("password", user.getUsername());
////        return "redirect:/show.jsp";
////    }
////8.4.2.2
////    @RequestMapping("/dologin.do")
////    public String doLogin(User user, RedirectAttributes rd) {
////        rd.addAttribute("username", user.getUsername());
////        rd.addAttribute("password", user.getUsername());
////        return "redirect:/show.jsp";
////    }
////【例8-16】实现登录成功后跳转到时百度首页，否则跳转到163网易邮箱页面。
////            1、修改控制器UserController的doLogin()方法：
//    //输入正确账号密码后进入main.jsp
//    //否则停留在login.jsp
//    @RequestMapping("/dologin.do")
//    public String doLogin(User user) {
//        if (user.getUsername().equals("张三") && user.getPassword().equals("123")) return "main";
//        else return "login";
//    }
////    @RequestMapping("/doregister.do")
////    public String doRegister(User user) {
////        if (user.getUsername().equals("张三") && user.getPassword().equals("123")) return "main";
////        else return "login";
////    }
//
//    @RequestMapping("/doregister.do")
//    public ModelAndView doRegister(User user, HttpSession session) {
//        ModelAndView mv = new ModelAndView();
//        session.setAttribute("user", user); //传递对象参数
//        mv.setViewName("redirect:/show2.jsp");
//        return mv;
//    }
//
//    //main.do进入主页面main.jsp
//    @RequestMapping("/main.do")
//    public String doMain() {
////        if (user.getUsername() == null) return "main";
////        else
//        return "forward:/WEB-INF/jsp/main_12_2_6.jsp";
//    }
//
//    @RequestMapping("/second2.do")
//    public String doSecond2() {
//        //return "login";  //转发到视图
//        return "forward:/WEB-INF/jsp/info.jsp";  //转发到视图
//    }
//
//    //    @RequestMapping("/doregister.do")
////    public ModelAndView doRegister(User user) {
////        ModelAndView mv = new ModelAndView();
////        mv.addObject("user", user);
////        mv.setViewName("forward:second.do");//转发到控制器
////        return mv;
////    }
////
////    @RequestMapping("/second.do")
////    public ModelAndView doSecond(User user) {
////        ModelAndView mv = new ModelAndView();
////        mv.addObject("user", user);
////        //mv.setViewName("info ");
////        mv.setViewName("forward:/WEB-INF/jsp/info.jsp");
////        return mv;
////    }
//
//    //【例8-12】用户注册完毕后，重定向到doSecond()方法，再由doSecond()重定向到显示用户注册信息。
//    //在控制器UserController中修改以下两个方法，在doSecond()形参需要与发送方参数类型和名称相同：
////    @RequestMapping("/doregister.do")
////    public ModelAndView doRegister(User user) {
////        ModelAndView mv = new ModelAndView();
////        mv.addObject("username", user.getUsername());//传递String参数
////        mv.addObject("password", user.getPassword());//传递String参数
////        mv.setViewName("redirect:second.do");//重定向到控制器
////        return mv;
////    }
//    //8-15
////    @RequestMapping("/doregister.do")
////    public ModelAndView doRegister(User user, HttpSession session) {
////        ModelAndView mv = new ModelAndView();
////        session.setAttribute("user", user); //传递对象参数
////        mv.setViewName("redirect:/show2.jsp");
////        return mv;
////    }
////9-1 用户注册时会发生不同形式的异常，分别捕捉到这些异常，跳转到相应的页面显示异常信息。
////    @RequestMapping("/doregister.do")
////    public ModelAndView doRegister(String username, String password) throws Exception {
////        ModelAndView mv = new ModelAndView();
////        if (!username.equals("张三")) throw new NameException("学生姓名不正确!");
////        if (password.length() < 3) throw new PasswordException("密码长度太小！");
////        if (password.length() > 10) throw new Exception("测试其他异常，跳转到其他页面！");
////        mv.addObject("username", username);
////        mv.addObject("password", password);
////        mv.setViewName("info1");
////        return mv;
////    }
//
//    @RequestMapping("/second.do")
//    public ModelAndView doSecond(String username, String password) {
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("username", username); //传递String参数
//        mv.addObject("password", password); //传递String参数
//        mv.setViewName("redirect:/show.jsp");//重定向到视图
//        return mv;
//    }
//
//    @RequestMapping("/{username}/{id}/user.do")
//    public ModelAndView doUser(@PathVariable String username, @PathVariable String id) {
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("user", username);
//        mv.setViewName("success");
//        System.out.println(username);
//        System.out.println(id);
//        return mv;
//    }
//
//    @RequestMapping("/interest.do")
//    public String interest() {
//        return "interest";
//    }
//
//    @RequestMapping("/dointerest.do")
//    public String doInterest(String[] myinterest) {
//        //测试用控制台输出各条兴趣
//        System.out.println("我的兴趣爱好有：");
//        for (String interest : myinterest)
//            System.out.print(interest + " ");
//        System.out.println();
//        return "interest";
//    }
//
//    @ExceptionHandler(NameException.class)
//    public ModelAndView HandleNameException(Exception ex) {
//        ModelAndView mv = new ModelAndView();
//        //do something;
//        mv.addObject("ex", ex);
//        mv.setViewName("nameError");
//        return mv;
//    }
//
//    @ExceptionHandler(PasswordException.class)
//    public ModelAndView HandlePasswordException(Exception ex) {
//        ModelAndView mv = new ModelAndView();
//        //do something;
//        mv.addObject("ex", ex);
//        mv.setViewName("passwordError");
//        return mv;
//    }
//
//    @ExceptionHandler
//    public ModelAndView HandleException(Exception ex) {
//        ModelAndView mv = new ModelAndView();
//        //do something;
//        mv.addObject("ex", ex);
//        mv.setViewName("defaultError");
//        return mv;
//    }
//
//
//}
