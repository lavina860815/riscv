// PR c++/33494

template<int> void foo(int(*f=0)()); // { dg-error "declared void|scope|erroneous-expression" }
