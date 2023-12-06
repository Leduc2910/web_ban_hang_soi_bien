package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUser {
    public static boolean checkUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            if ((int) session.getAttribute("role") == 1) {
                return true;
            }
        }
        return false;
    }

    public static String getNameUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            if (session.getAttribute("fullName") != null) {
                return (String) session.getAttribute("fullName");
            }
        }
        return null;
    }
}
