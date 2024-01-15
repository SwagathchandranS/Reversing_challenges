import java.util.Scanner;

public class Encryptedflag {
   private static final String bays_char = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
   private static final int bays_len = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".length();

   public static String yes(String var0) {
      String var1 = "3";
      StringBuilder var2 = new StringBuilder();

      for(int var3 = 0; var3 < var0.length(); ++var3) {
         var2.append((char)(var0.charAt(var3) ^ var1.charAt(var3 % var1.length())));
      }

      return var2.toString();
   }

   public static String no(String var0, String var1) {
      String var2 = var0 + var1;
      long var3 = (long)var2.hashCode();
      StringBuilder var5 = new StringBuilder();

      do {
         int var6 = (int)(var3 % (long)bays_len);
         var5.insert(0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".charAt(var6));
         var3 /= (long)bays_len;
      } while(var3 > 0L);

      return var5.toString();
   }

   public static void main(String[] var0) {
      System.out.println("Enter the arguments");
      Scanner var1 = new Scanner(System.in);
      String var2 = var1.nextLine();
      String var3 = var1.nextLine();
      var1.close();
      String var4 = "flag";
      String var5 = "flag{";
      String var6 = yes(var2);
      String var7 = no(var4, var3);

      if (var2.equals("G[Z@Z@G[VU_RT") && var3.equals("flag")) {
         String var8 = var5.concat(var6).concat(var7).concat("}");
         System.out.println(var8);
      } else {
         System.out.println("invalid");
      }
   }
}
