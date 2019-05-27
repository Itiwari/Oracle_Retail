#include<iostream>
using namespace std;

main()
{
  int a=1;
  int b = a;
  int n = 10;
  int k=0;
  cout <<a<<"\t"<<b;
  for(int i=0;i<8;i++)
  {
    k = a+b;
    a = b;
    b = k;
    cout <<"\t"<<k<<"\t";
  }
}
