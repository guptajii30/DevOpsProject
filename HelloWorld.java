public class HelloWorld {
    public static void main(String[] args) throws InterruptedException {
        while(true) {
            System.out.println("Hello from DevOps Pipeline! - " + new java.util.Date());
            Thread.sleep(5000); // Print every 5 seconds
        }
    }
}
