// { dg-do run  }
// { dg-options "-O" }
// { dg-error "limited range of data type" "16-bit target" { target xstormy16-*-* } 0 }
// { dg-error "shift count >=" "16-bit target" { target xstormy16-*-* } 0 }

int main()
{
  unsigned int x = 1381237248;

  if (sizeof (x) != 4)
    return 0;

  x =
    ({
      unsigned int y = x;
      ({
        unsigned int z = y;
        (unsigned int)
          ((((unsigned int)z & (unsigned int)0x000000ffUL) << 24)
           | (((unsigned int)z & (unsigned int)0x0000ff00UL) << 8)
           | (((unsigned int)z & (unsigned int)0x00ff0000UL) >> 8)
           | (((unsigned int)z & (unsigned int)0xff000000UL) >> 24));
       });
     });
  return x != 152658;
}
