import 'package:rcis_ep_task_one/rcis_ep_task_one.dart' as rcis_ep_task_one;

void main() 
{
  int n = 10;

  int prod = 1;
  
  for (int i = 1; i <= n; ++i)
  {
    if (i % 3 == 0)
    {
      prod *= i;
    }
  }
  
  print("Произведение чисел кратных трём от 0 до $n: $prod");
}
