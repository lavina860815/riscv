import A16;

import std.stdio;

class B16 : AA16
{
  public
    this()
    {
	super();
	printf("class B16\n");
    }
}

int main()
{
    new B16;

    return 0;
}
