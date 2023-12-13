package filter;

public class Validate {
    public static boolean regexPhoneNumber(String phoneNumber) {
        String phoneRegex = "^0[0-9]{9}$";
        if (phoneNumber.matches(phoneRegex)) {
            return true;
        }
        return false;
    }
}
