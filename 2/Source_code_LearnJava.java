import java.util.Scanner;

class LearnJava {
   public static void main(String[] var0) {
      LearnJava var1 = new LearnJava();
      Scanner var2 = new Scanner(System.in);
      System.out.print("Enter password: ");
      String var3 = var2.next();
      String var4 = var3.substring("flag{".length(), var3.length());
      if (var1.checkPassword(var4)) {
         System.out.println("Access granted.");
      } else {
         System.out.println("Access denied!");
      }

   }

   public boolean checkPassword(String var1) {
      byte[] var2 = var1.getBytes();
      byte[] var3 = new byte[]{75, 110, 111, 87, 95, 89, 111, 117, 82, 95, 65, 53, 67, 49, 49, 53, 125};
      if (var2.length != var3.length) {
         return false;
      } else {
         for(int var4 = 0; var4 < var3.length; ++var4) {
            if (var2[var4] != var3[var4]) {
               return false;
            }
         }

         return true;
      }
   }
}
