package myexceptions;

public class NameException extends Exception {
    public NameException() {
    }

    public NameException(String msg) {
        super(msg);
    }
}
