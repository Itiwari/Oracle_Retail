public class fibo{

     public static void main(String []args){
  int a=1;
  int b = a;
  int n = 10;
  int k=0;
    System.out.println (a+"\n"+b);
  for(int i=0;i<8;i++)
  {
    k = a+b;
    a = b;
    b = k;
    System.out.println (k);
  }
}

}
