package myexceptions;

public class PasswordException extends Exception {
    public PasswordException() {
    }

    public PasswordException(String msg) {
        super(msg);
    }
}
