//package com.Calculator;
//
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.struts.action.Action;
//import org.apache.struts.action.ActionForm;
//import org.apache.struts.action.ActionForward;
//import org.apache.struts.action.ActionMapping;
//
//import com.cn.bean.calFormBean;
//
///***
// * 告诉框架应该如何跳转
// */
//public class new_cal_strutsAction extends Action{
//
//    @Override
//    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
//                                 HttpServletResponse response) throws Exception {
//
//        calFormBean myForm= (calFormBean)form;
//
//        double value1=myForm.getValue1();
//
//        String operChose=myForm.getOperChose();
//        double value2=myForm.getValue2();
//
//        if("/".equals(operChose)&& value2==0) {
//
//            myForm.setResult("Infinity");
//            return mapping.findForward("Exception");
//
//        }else {
//            return mapping.findForward("caljstl");
//        }
//    }
//}
//
