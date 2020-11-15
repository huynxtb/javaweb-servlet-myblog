package com.myblog.controller.web;

import com.myblog.model.UserModel;
import com.myblog.service.ICategoryService;
import com.myblog.service.IUserService;
import com.myblog.utils.FormUtil;
import com.myblog.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat", "/dang-ky", "/thong-tin-nguoi-dung"})
public class HomeController extends HttpServlet {

    @Inject
    private ICategoryService categoryService;

    @Inject
    private IUserService userService;

    private static int count = 0;

    private static final long serialVersionUID = 2686801510274002166L;

    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        //String view = "";
        HttpSession sessionDefault = request.getSession();
        sessionDefault.setAttribute("USERONLINE", count);
        if (action != null && action.equals("login")) {
            String alert = request.getParameter("alert");
            String message = request.getParameter("message");
            if (message != null && alert != null) {
                request.setAttribute("message", resourceBundle.getString(message));
                request.setAttribute("alert", alert);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().removeValue(request, "USERMODEL");

            HttpSession sessionLogout = request.getSession();
            count = SessionUtil.getInstance().getUserOnline();
            sessionLogout.setAttribute("USERONLINE", count);
            response.sendRedirect(request.getContextPath() + "/trang-chu");
        } else if (action != null && action.equals("registration")) {
            String alert = request.getParameter("alert");
            String message = request.getParameter("message");
            if (message != null && alert != null) {
                request.setAttribute("message", resourceBundle.getString(message));
                request.setAttribute("alert", alert);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/views/registration.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("re-login")) {
            SessionUtil.getInstance().removeValue(request, "USERMODEL");
            RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("profile")) {
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/user/edit.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("categories", categoryService.findAll());
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("login")) {
            UserModel model = FormUtil.toModel(UserModel.class, request);
            model = userService.findByUserNameAndPasswordAndStatus(model.getUserName(), model.getPassword(), 1);
            if (model != null) {
                SessionUtil.getInstance().putValue(request, "USERMODEL", model);

                HttpSession sessionLogin = request.getSession();
                count = SessionUtil.getInstance().getUserOnline();
                sessionLogin.setAttribute("USERONLINE", count);

                if (model.getRole().getCode().equals("USER")) {
                    response.sendRedirect(request.getContextPath() + "/trang-chu");
                } else if (model.getRole().getCode().equals("ADMIN")) {
                    response.sendRedirect(request.getContextPath() + "/admin-home");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=username_password_invalid&alert=danger");
            }
        } else if (action != null && action.equals("registration")){
            UserModel model = FormUtil.toModel(UserModel.class, request);
            model = userService.findByUserName(model.getUserName());
            if (model!=null){
                if (model.getUserName().equals(userService.findByUserName(model.getUserName()).getUserName())){
                    response.sendRedirect(request.getContextPath() + "/dang-ky?action=registration&message=existed_user&alert=danger");
                }
            } else {
                UserModel saveUser = FormUtil.toModel(UserModel.class, request);
                saveUser = userService.save(saveUser);
                System.out.println(saveUser);
                response.sendRedirect(request.getContextPath() + "/dang-ky?action=registration&message=signin_success&alert=success");
            }
        }

    }
}
