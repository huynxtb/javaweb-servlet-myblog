package com.myblog.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class SessionUtil {

    private static SessionUtil sessionUtil = null;

    private static List ls =  new ArrayList();

    public static SessionUtil getInstance() {
        if (sessionUtil == null) {
            sessionUtil = new SessionUtil();
        }
        return sessionUtil;
    }

    public void putValue(HttpServletRequest request, String key, Object value) {
        ls.add(request.getSession().getId());
        request.getSession().setAttribute(key, value);
    }

    public Object getValue(HttpServletRequest request, String key) {
        return request.getSession().getAttribute(key);
    }

    public void removeValue(HttpServletRequest request, String key) {
        ls.remove(request.getSession().getId());
        request.getSession().removeAttribute(key);
    }

    public int getUserOnline(){
        return ls.size();
    }

}
