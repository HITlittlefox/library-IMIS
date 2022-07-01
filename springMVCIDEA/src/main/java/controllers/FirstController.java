package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 * @author 96361
 */
public class FirstController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
        ModelAndView mv = new ModelAndView();
        //封装数据
        mv.addObject("msg", "Hello SpringMVC!!!");
        //封装逻辑视图
        mv.setViewName("/WEB-INF/jsp/main_12_2_6.jsp");
        return mv;
    }
}
