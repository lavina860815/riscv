// Written in the D programming language.

/**
Functions that manipulate other functions.

This module provides functions for compile time function composition. These
functions are helpful when constructing predicates for the algorithms in
$(MREF std, algorithm) or $(MREF std, range).

$(SCRIPT inhibitQuickIndex = 1;)
$(BOOKTABLE ,
$(TR $(TH Function Name) $(TH Description)
)
    $(TR $(TD $(LREF adjoin))
        $(TD Joins a couple of functions into one that executes the original
        functions independently and returns a tuple with all the results.
    ))
    $(TR $(TD $(LREF compose), $(LREF pipe))
        $(TD Join a couple of functions into one that executes the original
        functions one after the other, using one function's result for the next
        function's argument.
    ))
    $(TR $(TD $(LREF forward))
        $(TD Forwards function arguments while saving ref-ness.
    ))
    $(TR $(TD $(LREF lessThan), $(LREF greaterThan), $(LREF equalTo))
        $(TD Ready-made predicate functions to compare two values.
    ))
    $(TR $(TD $(LREF memoize))
        $(TD Creates a function that caches its result for fast re-evaluation.
    ))
    $(TR $(TD $(LREF not))
        $(TD Creates a function that negates another.
    ))
    $(TR $(TD $(LREF partial))
        $(TD Creates a function that binds the first argument of a given function
        to a given value.
    ))
    $(TR $(TD $(LREF reverseArgs), $(LREF binaryReverseArgs))
        $(TD Predicate that reverses the order of its arguments.
    ))
    $(TR $(TD $(LREF toDelegate))
        $(TD Converts a callable to a delegate.
    ))
    $(TR $(TD $(LREF unaryFun), $(LREF binaryFun))
        $(TD Create a unary or binary function from a string. Most often
        used when defining algorithms on ranges.
    ))
)

Copyright: Copyright Andrei Alexandrescu 2008 - 2009.
License:   $(HTTP boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:   $(HTTP erdani.org, Andrei Alexandrescu)
Source:    $(PHOBOSSRC std/_functional.d)
*/
/*
         Copyright Andrei Alexandrescu 2008 - 2009.
Distributed under the Boost Software License, Version 1.0.
   (See accompanying file LICENSE_1_0.txt or copy at
         http://www.boost.org/LICENSE_1_0.txt)
*/
module std.functional;

import std.meta; // AliasSeq, Reverse
import std.traits; // isCallable, Parameters


private template needOpCallAlias(alias fun)
{
    /* Determine whether or not unaryFun and binaryFun need to alias to fun or
     * fun.opCall. Basically, fun is a function object if fun(...) compiles. We
     * want is(unaryFun!fun) (resp., is(binaryFun!fun)) to be true if fun is
     * any function object. There are 4 possible cases:
     *
     *  1) fun is the type of a function object with static opCall;
     *  2) fun is an instance of a function object with static opCall;
     *  3) fun is the type of a function object with non-static opCall;
     *  4) fun is an instance of a function object with non-static opCall.
     *
     * In case (1), is(unaryFun!fun) should compile, but does not if unaryFun
     * aliases itself to fun, because typeof(fun) is an error when fun itself
     * is a type. So it must be aliased to fun.opCall instead. All other cases
     * should be aliased to fun directly.
     */
    static if (is(typeof(fun.opCall) == function))
    {
        enum needOpCallAlias = !is(typeof(fun)) && __traits(compiles, () {
            return fun(Parameters!fun.init);
        });
    }
    else
        enum needOpCallAlias = false;
}

/**
Transforms a string representing an expression into a unary
function. The string must either use symbol name $(D a) as
the parameter or provide the symbol via the $(D parmName) argument.
If $(D fun) is not a string, $(D unaryFun) aliases itself away to $(D fun).
*/

template unaryFun(alias fun, string parmName = "a")
{
    static if (is(typeof(fun) : string))
    {
        static if (!fun._ctfeMatchUnary(parmName))
        {
            import std.algorithm, std.conv, std.exception, std.math, std.range, std.string;
            import std.meta, std.traits, std.typecons;
        }
        auto unaryFun(ElementType)(auto ref ElementType __a)
        {
            mixin("alias " ~ parmName ~ " = __a ;");
            return mixin(fun);
        }
    }
    else static if (needOpCallAlias!fun)
    {
        // Issue 9906
        alias unaryFun = fun.opCall;
    }
    else
    {
        alias unaryFun = fun;
    }
}

///
@safe unittest
{
    // Strings are compiled into functions:
    alias isEven = unaryFun!("(a & 1) == 0");
    assert(isEven(2) && !isEven(1));
}

@safe unittest
{
    static int f1(int a) { return a + 1; }
    static assert(is(typeof(unaryFun!(f1)(1)) == int));
    assert(unaryFun!(f1)(41) == 42);
    int f2(int a) { return a + 1; }
    static assert(is(typeof(unaryFun!(f2)(1)) == int));
    assert(unaryFun!(f2)(41) == 42);
    assert(unaryFun!("a + 1")(41) == 42);
    //assert(unaryFun!("return a + 1;")(41) == 42);

    int num = 41;
    assert(unaryFun!"a + 1"(num) == 42);

    // Issue 9906
    struct Seen
    {
        static bool opCall(int n) { return true; }
    }
    static assert(needOpCallAlias!Seen);
    static assert(is(typeof(unaryFun!Seen(1))));
    assert(unaryFun!Seen(1));

    Seen s;
    static assert(!needOpCallAlias!s);
    static assert(is(typeof(unaryFun!s(1))));
    assert(unaryFun!s(1));

    struct FuncObj
    {
        bool opCall(int n) { return true; }
    }
    FuncObj fo;
    static assert(!needOpCallAlias!fo);
    static assert(is(typeof(unaryFun!fo)));
    assert(unaryFun!fo(1));

    // Function object with non-static opCall can only be called with an
    // instance, not with merely the type.
    static assert(!is(typeof(unaryFun!FuncObj)));
}

/**
Transforms a string representing an expression into a binary function. The
string must either use symbol names $(D a) and $(D b) as the parameters or
provide the symbols via the $(D parm1Name) and $(D parm2Name) arguments.
If $(D fun) is not a string, $(D binaryFun) aliases itself away to
$(D fun).
*/

template binaryFun(alias fun, string parm1Name = "a",
        string parm2Name = "b")
{
    static if (is(typeof(fun) : string))
    {
        static if (!fun._ctfeMatchBinary(parm1Name, parm2Name))
        {
            import std.algorithm, std.conv, std.exception, std.math, std.range, std.string;
            import std.meta, std.traits, std.typecons;
        }
        auto binaryFun(ElementType1, ElementType2)
            (auto ref ElementType1 __a, auto ref ElementType2 __b)
        {
            mixin("alias "~parm1Name~" = __a ;");
            mixin("alias "~parm2Name~" = __b ;");
            return mixin(fun);
        }
    }
    else static if (needOpCallAlias!fun)
    {
        // Issue 9906
        alias binaryFun = fun.opCall;
    }
    else
    {
        alias binaryFun = fun;
    }
}

///
@safe unittest
{
    alias less = binaryFun!("a < b");
    assert(less(1, 2) && !less(2, 1));
    alias greater = binaryFun!("a > b");
    assert(!greater("1", "2") && greater("2", "1"));
}

@safe unittest
{
    static int f1(int a, string b) { return a + 1; }
    static assert(is(typeof(binaryFun!(f1)(1, "2")) == int));
    assert(binaryFun!(f1)(41, "a") == 42);
    string f2(int a, string b) { return b ~ "2"; }
    static assert(is(typeof(binaryFun!(f2)(1, "1")) == string));
    assert(binaryFun!(f2)(1, "4") == "42");
    assert(binaryFun!("a + b")(41, 1) == 42);
    //@@BUG
    //assert(binaryFun!("return a + b;")(41, 1) == 42);

    // Issue 9906
    struct Seen
    {
        static bool opCall(int x, int y) { return true; }
    }
    static assert(is(typeof(binaryFun!Seen)));
    assert(binaryFun!Seen(1,1));

    struct FuncObj
    {
        bool opCall(int x, int y) { return true; }
    }
    FuncObj fo;
    static assert(!needOpCallAlias!fo);
    static assert(is(typeof(binaryFun!fo)));
    assert(unaryFun!fo(1,1));

    // Function object with non-static opCall can only be called with an
    // instance, not with merely the type.
    static assert(!is(typeof(binaryFun!FuncObj)));
}

// skip all ASCII chars except a .. z, A .. Z, 0 .. 9, '_' and '.'.
private uint _ctfeSkipOp(ref string op)
{
    if (!__ctfe) assert(false);
    import std.ascii : isASCII, isAlphaNum;
    immutable oldLength = op.length;
    while (op.length)
    {
        immutable front = op[0];
        if (front.isASCII() && !(front.isAlphaNum() || front == '_' || front == '.'))
            op = op[1..$];
        else
            break;
    }
    return oldLength != op.length;
}

// skip all digits
private uint _ctfeSkipInteger(ref string op)
{
    if (!__ctfe) assert(false);
    import std.ascii : isDigit;
    immutable oldLength = op.length;
    while (op.length)
    {
        immutable front = op[0];
        if (front.isDigit())
            op = op[1..$];
        else
            break;
    }
    return oldLength != op.length;
}

// skip name
private uint _ctfeSkipName(ref string op, string name)
{
    if (!__ctfe) assert(false);
    if (op.length >= name.length && op[0 .. name.length] == name)
    {
        op = op[name.length..$];
        return 1;
    }
    return 0;
}

// returns 1 if $(D fun) is trivial unary function
private uint _ctfeMatchUnary(string fun, string name)
{
    if (!__ctfe) assert(false);
    fun._ctfeSkipOp();
    for (;;)
    {
        immutable h = fun._ctfeSkipName(name) + fun._ctfeSkipInteger();
        if (h == 0)
        {
            fun._ctfeSkipOp();
            break;
        }
        else if (h == 1)
        {
            if (!fun._ctfeSkipOp())
                break;
        }
        else
            return 0;
    }
    return fun.length == 0;
}

@safe unittest
{
    static assert(!_ctfeMatchUnary("sqrt(??)", "??"));
    static assert(!_ctfeMatchUnary("??.sqrt", "??"));
    static assert(!_ctfeMatchUnary(".??+??", "??"));
    static assert(!_ctfeMatchUnary("_??+??", "??"));
    static assert(!_ctfeMatchUnary("????", "??"));
    static assert(_ctfeMatchUnary("a+a", "a"));
    static assert(_ctfeMatchUnary("a + 10", "a"));
    static assert(_ctfeMatchUnary("4 == a", "a"));
    static assert(_ctfeMatchUnary("2 == a", "a"));
    static assert(_ctfeMatchUnary("1 != a", "a"));
    static assert(_ctfeMatchUnary("a != 4", "a"));
    static assert(_ctfeMatchUnary("a< 1", "a"));
    static assert(_ctfeMatchUnary("434 < a", "a"));
    static assert(_ctfeMatchUnary("132 > a", "a"));
    static assert(_ctfeMatchUnary("123 >a", "a"));
    static assert(_ctfeMatchUnary("a>82", "a"));
    static assert(_ctfeMatchUnary("??>82", "??"));
    static assert(_ctfeMatchUnary("??[??(??)]", "??"));
    static assert(_ctfeMatchUnary("??[21]", "??"));
}

// returns 1 if $(D fun) is trivial binary function
private uint _ctfeMatchBinary(string fun, string name1, string name2)
{
    if (!__ctfe) assert(false);
    fun._ctfeSkipOp();
    for (;;)
    {
        immutable h = fun._ctfeSkipName(name1) + fun._ctfeSkipName(name2) + fun._ctfeSkipInteger();
        if (h == 0)
        {
            fun._ctfeSkipOp();
            break;
        }
        else if (h == 1)
        {
            if (!fun._ctfeSkipOp())
                break;
        }
        else
            return 0;
    }
    return fun.length == 0;
}

@safe unittest
{

    static assert(!_ctfeMatchBinary("sqrt(??)", "??", "b"));
    static assert(!_ctfeMatchBinary("??.sqrt", "??", "b"));
    static assert(!_ctfeMatchBinary(".??+??", "??", "b"));
    static assert(!_ctfeMatchBinary("_??+??", "??", "b"));
    static assert(!_ctfeMatchBinary("????", "??", "b"));
    static assert(_ctfeMatchBinary("a+a", "a", "b"));
    static assert(_ctfeMatchBinary("a + 10", "a", "b"));
    static assert(_ctfeMatchBinary("4 == a", "a", "b"));
    static assert(_ctfeMatchBinary("2 == a", "a", "b"));
    static assert(_ctfeMatchBinary("1 != a", "a", "b"));
    static assert(_ctfeMatchBinary("a != 4", "a", "b"));
    static assert(_ctfeMatchBinary("a< 1", "a", "b"));
    static assert(_ctfeMatchBinary("434 < a", "a", "b"));
    static assert(_ctfeMatchBinary("132 > a", "a", "b"));
    static assert(_ctfeMatchBinary("123 >a", "a", "b"));
    static assert(_ctfeMatchBinary("a>82", "a", "b"));
    static assert(_ctfeMatchBinary("??>82", "??", "q"));
    static assert(_ctfeMatchBinary("??[??(10)]", "??", "q"));
    static assert(_ctfeMatchBinary("??[21]", "??", "q"));

    static assert(!_ctfeMatchBinary("sqrt(??)+b", "b", "??"));
    static assert(!_ctfeMatchBinary("??.sqrt-b", "b", "??"));
    static assert(!_ctfeMatchBinary(".??+b", "b", "??"));
    static assert(!_ctfeMatchBinary("_b+??", "b", "??"));
    static assert(!_ctfeMatchBinary("ba", "b", "a"));
    static assert(_ctfeMatchBinary("a+b", "b", "a"));
    static assert(_ctfeMatchBinary("a + b", "b", "a"));
    static assert(_ctfeMatchBinary("b == a", "b", "a"));
    static assert(_ctfeMatchBinary("b == a", "b", "a"));
    static assert(_ctfeMatchBinary("b != a", "b", "a"));
    static assert(_ctfeMatchBinary("a != b", "b", "a"));
    static assert(_ctfeMatchBinary("a< b", "b", "a"));
    static assert(_ctfeMatchBinary("b < a", "b", "a"));
    static assert(_ctfeMatchBinary("b > a", "b", "a"));
    static assert(_ctfeMatchBinary("b >a", "b", "a"));
    static assert(_ctfeMatchBinary("a>b", "b", "a"));
    static assert(_ctfeMatchBinary("??>b", "b", "??"));
    static assert(_ctfeMatchBinary("b[??(-1)]", "b", "??"));
    static assert(_ctfeMatchBinary("??[-21]", "b", "??"));
}

//undocumented
template safeOp(string S)
if (S=="<"||S==">"||S=="<="||S==">="||S=="=="||S=="!=")
{
    import std.traits : isIntegral;
    private bool unsafeOp(ElementType1, ElementType2)(ElementType1 a, ElementType2 b) pure
        if (isIntegral!ElementType1 && isIntegral!ElementType2)
    {
        import std.traits : CommonType;
        alias T = CommonType!(ElementType1, ElementType2);
        return mixin("cast(T)a "~S~" cast(T) b");
    }

    bool safeOp(T0, T1)(auto ref T0 a, auto ref T1 b)
    {
        import std.traits : mostNegative;
        static if (isIntegral!T0 && isIntegral!T1 &&
                   (mostNegative!T0 < 0) != (mostNegative!T1 < 0))
        {
            static if (S == "<=" || S == "<")
            {
                static if (mostNegative!T0 < 0)
                    immutable result = a < 0 || unsafeOp(a, b);
                else
                    immutable result = b >= 0 && unsafeOp(a, b);
            }
            else
            {
                static if (mostNegative!T0 < 0)
                    immutable result = a >= 0 && unsafeOp(a, b);
                else
                    immutable result = b < 0 || unsafeOp(a, b);
            }
        }
        else
        {
            static assert(is(typeof(mixin("a "~S~" b"))),
                "Invalid arguments: Cannot compare types " ~ T0.stringof ~ " and " ~ T1.stringof ~ ".");

            immutable result = mixin("a "~S~" b");
        }
        return result;
    }
}

@safe unittest //check user defined types
{
    import std.algorithm.comparison : equal;
    struct Foo
    {
        int a;
        auto opEquals(Foo foo)
        {
            return a == foo.a;
        }
    }
    assert(safeOp!"!="(Foo(1), Foo(2)));
}

/**
   Predicate that returns $(D_PARAM a < b).
   Correctly compares signed and unsigned integers, ie. -1 < 2U.
*/
alias lessThan = safeOp!"<";

///
pure @safe @nogc nothrow unittest
{
    assert(lessThan(2, 3));
    assert(lessThan(2U, 3U));
    assert(lessThan(2, 3.0));
    assert(lessThan(-2, 3U));
    assert(lessThan(2, 3U));
    assert(!lessThan(3U, -2));
    assert(!lessThan(3U, 2));
    assert(!lessThan(0, 0));
    assert(!lessThan(0U, 0));
    assert(!lessThan(0, 0U));
}

/**
   Predicate that returns $(D_PARAM a > b).
   Correctly compares signed and unsigned integers, ie. 2U > -1.
*/
alias greaterThan = safeOp!">";

///
@safe unittest
{
    assert(!greaterThan(2, 3));
    assert(!greaterThan(2U, 3U));
    assert(!greaterThan(2, 3.0));
    assert(!greaterThan(-2, 3U));
    assert(!greaterThan(2, 3U));
    assert(greaterThan(3U, -2));
    assert(greaterThan(3U, 2));
    assert(!greaterThan(0, 0));
    assert(!greaterThan(0U, 0));
    assert(!greaterThan(0, 0U));
}

/**
   Predicate that returns $(D_PARAM a == b).
   Correctly compares signed and unsigned integers, ie. !(-1 == ~0U).
*/
alias equalTo = safeOp!"==";

///
@safe unittest
{
    assert(equalTo(0U, 0));
    assert(equalTo(0, 0U));
    assert(!equalTo(-1, ~0U));
}
/**
   N-ary predicate that reverses the order of arguments, e.g., given
   $(D pred(a, b, c)), returns $(D pred(c, b, a)).
*/
template reverseArgs(alias pred)
{
    auto reverseArgs(Args...)(auto ref Args args)
        if (is(typeof(pred(Reverse!args))))
    {
        return pred(Reverse!args);
    }
}

///
@safe unittest
{
    alias gt = reverseArgs!(binaryFun!("a < b"));
    assert(gt(2, 1) && !gt(1, 1));
    int x = 42;
    bool xyz(int a, int b) { return a * x < b / x; }
    auto foo = &xyz;
    foo(4, 5);
    alias zyx = reverseArgs!(foo);
    assert(zyx(5, 4) == foo(4, 5));
}

///
@safe unittest
{
    int abc(int a, int b, int c) { return a * b + c; }
    alias cba = reverseArgs!abc;
    assert(abc(91, 17, 32) == cba(32, 17, 91));
}

///
@safe unittest
{
    int a(int a) { return a * 2; }
    alias _a = reverseArgs!a;
    assert(a(2) == _a(2));
}

///
@safe unittest
{
    int b() { return 4; }
    alias _b = reverseArgs!b;
    assert(b() == _b());
}

/**
   Binary predicate that reverses the order of arguments, e.g., given
   $(D pred(a, b)), returns $(D pred(b, a)).
*/
template binaryReverseArgs(alias pred)
{
    auto binaryReverseArgs(ElementType1, ElementType2)
            (auto ref ElementType1 a, auto ref ElementType2 b)
    {
        return pred(b, a);
    }
}

///
@safe unittest
{
    alias gt = binaryReverseArgs!(binaryFun!("a < b"));
    assert(gt(2, 1) && !gt(1, 1));
}

///
@safe unittest
{
    int x = 42;
    bool xyz(int a, int b) { return a * x < b / x; }
    auto foo = &xyz;
    foo(4, 5);
    alias zyx = binaryReverseArgs!(foo);
    assert(zyx(5, 4) == foo(4, 5));
}

/**
Negates predicate $(D pred).
 */
template not(alias pred)
{
    auto not(T...)(auto ref T args)
    {
        static if (is(typeof(!pred(args))))
            return !pred(args);
        else static if (T.length == 1)
            return !unaryFun!pred(args);
        else static if (T.length == 2)
            return !binaryFun!pred(args);
        else
            static assert(0);
    }
}

///
@safe unittest
{
    import std.algorithm.searching : find;
    import std.functional;
    import std.uni : isWhite;
    string a = "   Hello, world!";
    assert(find!(not!isWhite)(a) == "Hello, world!");
}

@safe unittest
{
    assert(not!"a != 5"(5));
    assert(not!"a != b"(5, 5));

    assert(not!(() => false)());
    assert(not!(a => a != 5)(5));
    assert(not!((a, b) => a != b)(5, 5));
    assert(not!((a, b, c) => a * b * c != 125 )(5, 5, 5));
}

/**
$(LINK2 http://en.wikipedia.org/wiki/Partial_application, Partially
applies) $(D_PARAM fun) by tying its first argument to $(D_PARAM arg).
 */
template partial(alias fun, alias arg)
{
    static if (is(typeof(fun) == delegate) || is(typeof(fun) == function))
    {
        import std.traits : ReturnType;
        ReturnType!fun partial(Parameters!fun[1..$] args2)
        {
            return fun(arg, args2);
        }
    }
    else
    {
        auto partial(Ts...)(Ts args2)
        {
            static if (is(typeof(fun(arg, args2))))
            {
                return fun(arg, args2);
            }
            else
            {
                static string errormsg()
                {
                    string msg = "Cannot call '" ~ fun.stringof ~ "' with arguments " ~
                        "(" ~ arg.stringof;
                    foreach (T; Ts)
                        msg ~= ", " ~ T.stringof;
                    msg ~= ").";
                    return msg;
                }
                static assert(0, errormsg());
            }
        }
    }
}

///
@safe unittest
{
    int fun(int a, int b) { return a + b; }
    alias fun5 = partial!(fun, 5);
    assert(fun5(6) == 11);
    // Note that in most cases you'd use an alias instead of a value
    // assignment. Using an alias allows you to partially evaluate template
    // functions without committing to a particular type of the function.
}

// tests for partially evaluating callables
@safe unittest
{
    static int f1(int a, int b) { return a + b; }
    assert(partial!(f1, 5)(6) == 11);

    int f2(int a, int b) { return a + b; }
    int x = 5;
    assert(partial!(f2, x)(6) == 11);
    x = 7;
    assert(partial!(f2, x)(6) == 13);
    static assert(partial!(f2, 5)(6) == 11);

    auto dg = &f2;
    auto f3 = &partial!(dg, x);
    assert(f3(6) == 13);

    static int funOneArg(int a) { return a; }
    assert(partial!(funOneArg, 1)() == 1);

    static int funThreeArgs(int a, int b, int c) { return a + b + c; }
    alias funThreeArgs1 = partial!(funThreeArgs, 1);
    assert(funThreeArgs1(2, 3) == 6);
    static assert(!is(typeof(funThreeArgs1(2))));

    enum xe = 5;
    alias fe = partial!(f2, xe);
    static assert(fe(6) == 11);
}

// tests for partially evaluating templated/overloaded callables
@safe unittest
{
    static auto add(A, B)(A x, B y)
    {
        return x + y;
    }

    alias add5 = partial!(add, 5);
    assert(add5(6) == 11);
    static assert(!is(typeof(add5())));
    static assert(!is(typeof(add5(6, 7))));

    // taking address of templated partial evaluation needs explicit type
    auto dg = &add5!(int);
    assert(dg(6) == 11);

    int x = 5;
    alias addX = partial!(add, x);
    assert(addX(6) == 11);

    static struct Callable
    {
        static string opCall(string a, string b) { return a ~ b; }
        int opCall(int a, int b) { return a * b; }
        double opCall(double a, double b) { return a + b; }
    }
    Callable callable;
    assert(partial!(Callable, "5")("6") == "56");
    assert(partial!(callable, 5)(6) == 30);
    assert(partial!(callable, 7.0)(3.0) == 7.0 + 3.0);

    static struct TCallable
    {
        auto opCall(A, B)(A a, B b)
        {
            return a + b;
        }
    }
    TCallable tcallable;
    assert(partial!(tcallable, 5)(6) == 11);
    static assert(!is(typeof(partial!(tcallable, "5")(6))));

    static A funOneArg(A)(A a) { return a; }
    alias funOneArg1 = partial!(funOneArg, 1);
    assert(funOneArg1() == 1);

    static auto funThreeArgs(A, B, C)(A a, B b, C c) { return a + b + c; }
    alias funThreeArgs1 = partial!(funThreeArgs, 1);
    assert(funThreeArgs1(2, 3) == 6);
    static assert(!is(typeof(funThreeArgs1(1))));

    auto dg2 = &funOneArg1!();
    assert(dg2() == 1);
}

/**
Takes multiple functions and adjoins them together. The result is a
$(REF Tuple, std,typecons) with one element per passed-in function. Upon
invocation, the returned tuple is the adjoined results of all
functions.

Note: In the special case where only a single function is provided
($(D F.length == 1)), adjoin simply aliases to the single passed function
($(D F[0])).
*/
template adjoin(F...)
if (F.length == 1)
{
    alias adjoin = F[0];
}
/// ditto
template adjoin(F...)
if (F.length > 1)
{
    auto adjoin(V...)(auto ref V a)
    {
        import std.typecons : tuple;
        static if (F.length == 2)
        {
            return tuple(F[0](a), F[1](a));
        }
        else static if (F.length == 3)
        {
            return tuple(F[0](a), F[1](a), F[2](a));
        }
        else
        {
            import std.format : format;
            import std.range : iota;
            return mixin (q{tuple(%(F[%s](a)%|, %))}.format(iota(0, F.length)));
        }
    }
}

///
@safe unittest
{
    import std.functional, std.typecons : Tuple;
    static bool f1(int a) { return a != 0; }
    static int f2(int a) { return a / 2; }
    auto x = adjoin!(f1, f2)(5);
    assert(is(typeof(x) == Tuple!(bool, int)));
    assert(x[0] == true && x[1] == 2);
}

@safe unittest
{
    import std.typecons : Tuple;
    static bool F1(int a) { return a != 0; }
    auto x1 = adjoin!(F1)(5);
    static int F2(int a) { return a / 2; }
    auto x2 = adjoin!(F1, F2)(5);
    assert(is(typeof(x2) == Tuple!(bool, int)));
    assert(x2[0] && x2[1] == 2);
    auto x3 = adjoin!(F1, F2, F2)(5);
    assert(is(typeof(x3) == Tuple!(bool, int, int)));
    assert(x3[0] && x3[1] == 2 && x3[2] == 2);

    bool F4(int a) { return a != x1; }
    alias eff4 = adjoin!(F4);
    static struct S
    {
        bool delegate(int) @safe store;
        int fun() { return 42 + store(5); }
    }
    S s;
    s.store = (int a) { return eff4(a); };
    auto x4 = s.fun();
    assert(x4 == 43);
}

@safe unittest
{
    import std.meta : staticMap;
    import std.typecons : Tuple, tuple;
    alias funs = staticMap!(unaryFun, "a", "a * 2", "a * 3", "a * a", "-a");
    alias afun = adjoin!funs;
    assert(afun(5) == tuple(5, 10, 15, 25, -5));

    static class C{}
    alias IC = immutable(C);
    IC foo(){return typeof(return).init;}
    Tuple!(IC, IC, IC, IC) ret1 = adjoin!(foo, foo, foo, foo)();

    static struct S{int* p;}
    alias IS = immutable(S);
    IS bar(){return typeof(return).init;}
    enum Tuple!(IS, IS, IS, IS) ret2 = adjoin!(bar, bar, bar, bar)();
}

/**
   Composes passed-in functions $(D fun[0], fun[1], ...) returning a
   function $(D f(x)) that in turn returns $(D
   fun[0](fun[1](...(x)))...). Each function can be a regular
   functions, a delegate, or a string.

   See_Also: $(LREF pipe)
*/
template compose(fun...)
{
    static if (fun.length == 1)
    {
        alias compose = unaryFun!(fun[0]);
    }
    else static if (fun.length == 2)
    {
        // starch
        alias fun0 = unaryFun!(fun[0]);
        alias fun1 = unaryFun!(fun[1]);

        // protein: the core composition operation
        typeof({ E a; return fun0(fun1(a)); }()) compose(E)(E a)
        {
            return fun0(fun1(a));
        }
    }
    else
    {
        // protein: assembling operations
        alias compose = compose!(fun[0], compose!(fun[1 .. $]));
    }
}

///
@safe unittest
{
    import std.algorithm.comparison : equal;
    import std.algorithm.iteration : map;
    import std.array : split;
    import std.conv : to;

    // First split a string in whitespace-separated tokens and then
    // convert each token into an integer
    assert(compose!(map!(to!(int)), split)("1 2 3").equal([1, 2, 3]));
}

/**
   Pipes functions in sequence. Offers the same functionality as $(D
   compose), but with functions specified in reverse order. This may
   lead to more readable code in some situation because the order of
   execution is the same as lexical order.

   Example:

----
// Read an entire text file, split the resulting string in
// whitespace-separated tokens, and then convert each token into an
// integer
int[] a = pipe!(readText, split, map!(to!(int)))("file.txt");
----

   See_Also: $(LREF compose)
 */
alias pipe(fun...) = compose!(Reverse!(fun));

@safe unittest
{
    import std.conv : to;
    string foo(int a) { return to!(string)(a); }
    int bar(string a) { return to!(int)(a) + 1; }
    double baz(int a) { return a + 0.5; }
    assert(compose!(baz, bar, foo)(1) == 2.5);
    assert(pipe!(foo, bar, baz)(1) == 2.5);

    assert(compose!(baz, `to!(int)(a) + 1`, foo)(1) == 2.5);
    assert(compose!(baz, bar)("1"[]) == 2.5);

    assert(compose!(baz, bar)("1") == 2.5);

    assert(compose!(`a + 0.5`, `to!(int)(a) + 1`, foo)(1) == 2.5);
}

/**
 * $(LINK2 https://en.wikipedia.org/wiki/Memoization, Memoizes) a function so as
 * to avoid repeated computation. The memoization structure is a hash table keyed by a
 * tuple of the function's arguments. There is a speed gain if the
 * function is repeatedly called with the same arguments and is more
 * expensive than a hash table lookup. For more information on memoization, refer to $(HTTP docs.google.com/viewer?url=http%3A%2F%2Fhop.perl.plover.com%2Fbook%2Fpdf%2F03CachingAndMemoization.pdf, this book chapter).

Example:
----
double transmogrify(int a, string b)
{
   ... expensive computation ...
}
alias fastTransmogrify = memoize!transmogrify;
unittest
{
    auto slow = transmogrify(2, "hello");
    auto fast = fastTransmogrify(2, "hello");
    assert(slow == fast);
}
----

Technically the memoized function should be pure because $(D memoize) assumes it will
always return the same result for a given tuple of arguments. However, $(D memoize) does not
enforce that because sometimes it
is useful to memoize an impure function, too.
*/
template memoize(alias fun)
{
    import std.traits : ReturnType;
    // alias Args = Parameters!fun; // Bugzilla 13580

    ReturnType!fun memoize(Parameters!fun args)
    {
        alias Args = Parameters!fun;
        import std.typecons : Tuple;

        static ReturnType!fun[Tuple!Args] memo;
        auto t = Tuple!Args(args);
        if (auto p = t in memo)
            return *p;
        return memo[t] = fun(args);
    }
}

/// ditto
template memoize(alias fun, uint maxSize)
{
    import std.traits : ReturnType;
    // alias Args = Parameters!fun; // Bugzilla 13580
    ReturnType!fun memoize(Parameters!fun args)
    {
        import std.traits : hasIndirections;
        import std.typecons : tuple;
        static struct Value { Parameters!fun args; ReturnType!fun res; }
        static Value[] memo;
        static size_t[] initialized;

        if (!memo.length)
        {
            import core.memory : GC;

            // Ensure no allocation overflows
            static assert(maxSize < size_t.max / Value.sizeof);
            static assert(maxSize < size_t.max - (8 * size_t.sizeof - 1));

            enum attr = GC.BlkAttr.NO_INTERIOR | (hasIndirections!Value ? 0 : GC.BlkAttr.NO_SCAN);
            memo = (cast(Value*) GC.malloc(Value.sizeof * maxSize, attr))[0 .. maxSize];
            enum nwords = (maxSize + 8 * size_t.sizeof - 1) / (8 * size_t.sizeof);
            initialized = (cast(size_t*) GC.calloc(nwords * size_t.sizeof, attr | GC.BlkAttr.NO_SCAN))[0 .. nwords];
        }

        import core.bitop : bt, bts;
        import std.conv : emplace;

        size_t hash;
        foreach (ref arg; args)
            hash = hashOf(arg, hash);
        // cuckoo hashing
        immutable idx1 = hash % maxSize;
        if (!bt(initialized.ptr, idx1))
        {
            emplace(&memo[idx1], args, fun(args));
            bts(initialized.ptr, idx1); // only set to initialized after setting args and value (bugzilla 14025)
            return memo[idx1].res;
        }
        else if (memo[idx1].args == args)
            return memo[idx1].res;
        // FNV prime
        immutable idx2 = (hash * 16_777_619) % maxSize;
        if (!bt(initialized.ptr, idx2))
        {
            emplace(&memo[idx2], memo[idx1]);
            bts(initialized.ptr, idx2); // only set to initialized after setting args and value (bugzilla 14025)
        }
        else if (memo[idx2].args == args)
            return memo[idx2].res;
        else if (idx1 != idx2)
            memo[idx2] = memo[idx1];

        memo[idx1] = Value(args, fun(args));
        return memo[idx1].res;
    }
}

/**
 * To _memoize a recursive function, simply insert the memoized call in lieu of the plain recursive call.
 * For example, to transform the exponential-time Fibonacci implementation into a linear-time computation:
 */
@safe unittest
{
    ulong fib(ulong n) @safe
    {
        return n < 2 ? n : memoize!fib(n - 2) + memoize!fib(n - 1);
    }
    assert(fib(10) == 55);
}

/**
 * To improve the speed of the factorial function,
 */
@safe unittest
{
    ulong fact(ulong n) @safe
    {
        return n < 2 ? 1 : n * memoize!fact(n - 1);
    }
    assert(fact(10) == 3628800);
}

/**
 * This memoizes all values of $(D fact) up to the largest argument. To only cache the final
 * result, move $(D memoize) outside the function as shown below.
 */
@safe unittest
{
    ulong factImpl(ulong n) @safe
    {
        return n < 2 ? 1 : n * factImpl(n - 1);
    }
    alias fact = memoize!factImpl;
    assert(fact(10) == 3628800);
}

/**
 * When the $(D maxSize) parameter is specified, memoize will used
 * a fixed size hash table to limit the number of cached entries.
 */
@system unittest // not @safe due to memoize
{
    ulong fact(ulong n)
    {
        // Memoize no more than 8 values
        return n < 2 ? 1 : n * memoize!(fact, 8)(n - 1);
    }
    assert(fact(8) == 40320);
    // using more entries than maxSize will overwrite existing entries
    assert(fact(10) == 3628800);
}

@system unittest // not @safe due to memoize
{
    import core.math : sqrt;
    alias msqrt = memoize!(function double(double x) { return sqrt(x); });
    auto y = msqrt(2.0);
    assert(y == msqrt(2.0));
    y = msqrt(4.0);
    assert(y == sqrt(4.0));

    // alias mrgb2cmyk = memoize!rgb2cmyk;
    // auto z = mrgb2cmyk([43, 56, 76]);
    // assert(z == mrgb2cmyk([43, 56, 76]));

    //alias mfib = memoize!fib;

    static ulong fib(ulong n) @safe
    {
        alias mfib = memoize!fib;
        return n < 2 ? 1 : mfib(n - 2) + mfib(n - 1);
    }

    auto z = fib(10);
    assert(z == 89);

    static ulong fact(ulong n) @safe
    {
        alias mfact = memoize!fact;
        return n < 2 ? 1 : n * mfact(n - 1);
    }
    assert(fact(10) == 3628800);

    // Issue 12568
    static uint len2(const string s) { // Error
    alias mLen2 = memoize!len2;
    if (s.length == 0)
        return 0;
    else
        return 1 + mLen2(s[1 .. $]);
    }

    int _func(int x) @safe { return 1; }
    alias func = memoize!(_func, 10);
    assert(func(int.init) == 1);
    assert(func(int.init) == 1);
}

// 16079: memoize should work with arrays
@safe unittest
{
    int executed = 0;
    T median(T)(const T[] nums) {
        import std.algorithm.sorting : sort;
        executed++;
        auto arr = nums.dup;
        arr.sort();
        if (arr.length % 2)
            return arr[$ / 2];
        else
            return (arr[$ / 2 - 1]
                + arr[$ / 2]) / 2;
    }

    alias fastMedian = memoize!(median!int);

    assert(fastMedian([7, 5, 3]) == 5);
    assert(fastMedian([7, 5, 3]) == 5);

    assert(executed == 1);
}

// 16079: memoize should work with structs
@safe unittest
{
    int executed = 0;
    T pickFirst(T)(T first)
    {
        executed++;
        return first;
    }

    struct Foo { int k; }
    Foo A = Foo(3);

    alias first = memoize!(pickFirst!Foo);
    assert(first(Foo(3)) == A);
    assert(first(Foo(3)) == A);
    assert(executed == 1);
}

// 16079: memoize should work with classes
@safe unittest
{
    int executed = 0;
    T pickFirst(T)(T first)
    {
        executed++;
        return first;
    }

    class Bar
    {
        size_t k;
        this(size_t k)
        {
            this.k = k;
        }
        override size_t toHash()
        {
            return k;
        }
        override bool opEquals(Object o)
        {
            auto b = cast(Bar) o;
            return b && k == b.k;
        }
    }

    alias firstClass = memoize!(pickFirst!Bar);
    assert(firstClass(new Bar(3)).k == 3);
    assert(firstClass(new Bar(3)).k == 3);
    assert(executed == 1);
}

private struct DelegateFaker(F)
{
    import std.typecons : FuncInfo, MemberFunctionGenerator;

    // for @safe
    static F castToF(THIS)(THIS x) @trusted
    {
        return cast(F) x;
    }

    /*
     * What all the stuff below does is this:
     *--------------------
     * struct DelegateFaker(F) {
     *     extern(linkage)
     *     [ref] ReturnType!F doIt(Parameters!F args) [@attributes]
     *     {
     *         auto fp = cast(F) &this;
     *         return fp(args);
     *     }
     * }
     *--------------------
     */

    // We will use MemberFunctionGenerator in std.typecons.  This is a policy
    // configuration for generating the doIt().
    template GeneratingPolicy()
    {
        // Inform the genereator that we only have type information.
        enum WITHOUT_SYMBOL = true;

        // Generate the function body of doIt().
        template generateFunctionBody(unused...)
        {
            enum generateFunctionBody =
            // [ref] ReturnType doIt(Parameters args) @attributes
            q{
                // When this function gets called, the this pointer isn't
                // really a this pointer (no instance even really exists), but
                // a function pointer that points to the function to be called.
                // Cast it to the correct type and call it.

                auto fp = castToF(&this);
                return fp(args);
            };
        }
    }
    // Type information used by the generated code.
    alias FuncInfo_doIt = FuncInfo!(F);

    // Generate the member function doIt().
    mixin( MemberFunctionGenerator!(GeneratingPolicy!())
            .generateFunction!("FuncInfo_doIt", "doIt", F) );
}

/**
 * Convert a callable to a delegate with the same parameter list and
 * return type, avoiding heap allocations and use of auxiliary storage.
 *
 * Example:
 * ----
 * void doStuff() {
 *     writeln("Hello, world.");
 * }
 *
 * void runDelegate(void delegate() myDelegate) {
 *     myDelegate();
 * }
 *
 * auto delegateToPass = toDelegate(&doStuff);
 * runDelegate(delegateToPass);  // Calls doStuff, prints "Hello, world."
 * ----
 *
 * BUGS:
 * $(UL
 *   $(LI Does not work with $(D @safe) functions.)
 *   $(LI Ignores C-style / D-style variadic arguments.)
 * )
 */
auto toDelegate(F)(auto ref F fp)
if (isCallable!(F))
{
    static if (is(F == delegate))
    {
        return fp;
    }
    else static if (is(typeof(&F.opCall) == delegate)
                || (is(typeof(&F.opCall) V : V*) && is(V == function)))
    {
        return toDelegate(&fp.opCall);
    }
    else
    {
        alias DelType = typeof(&(new DelegateFaker!(F)).doIt);

        static struct DelegateFields {
            union {
                DelType del;
                //pragma(msg, typeof(del));

                struct {
                    void* contextPtr;
                    void* funcPtr;
                }
            }
        }

        // fp is stored in the returned delegate's context pointer.
        // The returned delegate's function pointer points to
        // DelegateFaker.doIt.
        DelegateFields df;

        df.contextPtr = cast(void*) fp;

        DelegateFaker!(F) dummy;
        auto dummyDel = &dummy.doIt;
        df.funcPtr = dummyDel.funcptr;

        return df.del;
    }
}

///
@system unittest
{
    static int inc(ref uint num) {
        num++;
        return 8675309;
    }

    uint myNum = 0;
    auto incMyNumDel = toDelegate(&inc);
    auto returnVal = incMyNumDel(myNum);
    assert(myNum == 1);
}

@system unittest // not @safe due to toDelegate
{
    static int inc(ref uint num) {
        num++;
        return 8675309;
    }

    uint myNum = 0;
    auto incMyNumDel = toDelegate(&inc);
    int delegate(ref uint) dg = incMyNumDel;
    auto returnVal = incMyNumDel(myNum);
    assert(myNum == 1);

    interface I { int opCall(); }
    class C: I { int opCall() { inc(myNum); return myNum;} }
    auto c = new C;
    auto i = cast(I) c;

    auto getvalc = toDelegate(c);
    assert(getvalc() == 2);

    auto getvali = toDelegate(i);
    assert(getvali() == 3);

    struct S1 { int opCall() { inc(myNum); return myNum; } }
    static assert(!is(typeof(&s1.opCall) == delegate));
    S1 s1;
    auto getvals1 = toDelegate(s1);
    assert(getvals1() == 4);

    struct S2 { static int opCall() { return 123456; } }
    static assert(!is(typeof(&S2.opCall) == delegate));
    S2 s2;
    auto getvals2 =&S2.opCall;
    assert(getvals2() == 123456);

    /* test for attributes */
    {
        static int refvar = 0xDeadFace;

        static ref int func_ref() { return refvar; }
        static int func_pure() pure { return 1; }
        static int func_nothrow() nothrow { return 2; }
        static int func_property() @property { return 3; }
        static int func_safe() @safe { return 4; }
        static int func_trusted() @trusted { return 5; }
        static int func_system() @system { return 6; }
        static int func_pure_nothrow() pure nothrow { return 7; }
        static int func_pure_nothrow_safe() pure nothrow @safe { return 8; }

        auto dg_ref = toDelegate(&func_ref);
        int delegate() pure dg_pure = toDelegate(&func_pure);
        int delegate() nothrow dg_nothrow = toDelegate(&func_nothrow);
        int delegate() @property dg_property = toDelegate(&func_property);
        int delegate() @safe dg_safe = toDelegate(&func_safe);
        int delegate() @trusted dg_trusted = toDelegate(&func_trusted);
        int delegate() @system dg_system = toDelegate(&func_system);
        int delegate() pure nothrow dg_pure_nothrow = toDelegate(&func_pure_nothrow);
        int delegate() @safe pure nothrow dg_pure_nothrow_safe = toDelegate(&func_pure_nothrow_safe);

        //static assert(is(typeof(dg_ref) == ref int delegate())); // [BUG@DMD]

        assert(dg_ref() == refvar);
        assert(dg_pure() == 1);
        assert(dg_nothrow() == 2);
        assert(dg_property() == 3);
        assert(dg_safe() == 4);
        assert(dg_trusted() == 5);
        assert(dg_system() == 6);
        assert(dg_pure_nothrow() == 7);
        assert(dg_pure_nothrow_safe() == 8);
    }
    /* test for linkage */
    {
        struct S
        {
            extern(C) static void xtrnC() {}
            extern(D) static void xtrnD() {}
        }
        auto dg_xtrnC = toDelegate(&S.xtrnC);
        auto dg_xtrnD = toDelegate(&S.xtrnD);
        static assert(! is(typeof(dg_xtrnC) == typeof(dg_xtrnD)));
    }
}

/**
Forwards function arguments with saving ref-ness.
*/
template forward(args...)
{
    static if (args.length)
    {
        import std.algorithm.mutation : move;

        alias arg = args[0];
        static if (__traits(isRef, arg))
            alias fwd = arg;
        else
            @property fwd()(){ return move(arg); }
        alias forward = AliasSeq!(fwd, forward!(args[1..$]));
    }
    else
        alias forward = AliasSeq!();
}

///
@safe unittest
{
    class C
    {
        static int foo(int n) { return 1; }
        static int foo(ref int n) { return 2; }
    }
    int bar()(auto ref int x) { return C.foo(forward!x); }

    assert(bar(1) == 1);
    int i;
    assert(bar(i) == 2);
}

///
@safe unittest
{
    void foo(int n, ref string s) { s = null; foreach (i; 0 .. n) s ~= "Hello"; }

    // forwards all arguments which are bound to parameter tuple
    void bar(Args...)(auto ref Args args) { return foo(forward!args); }

    // forwards all arguments with swapping order
    void baz(Args...)(auto ref Args args) { return foo(forward!args[$/2..$], forward!args[0..$/2]); }

    string s;
    bar(1, s);
    assert(s == "Hello");
    baz(s, 2);
    assert(s == "HelloHello");
}

@safe unittest
{
    auto foo(TL...)(auto ref TL args)
    {
        string result = "";
        foreach (i, _; args)
        {
            //pragma(msg, "[",i,"] ", __traits(isRef, args[i]) ? "L" : "R");
            result ~= __traits(isRef, args[i]) ? "L" : "R";
        }
        return result;
    }

    string bar(TL...)(auto ref TL args)
    {
        return foo(forward!args);
    }
    string baz(TL...)(auto ref TL args)
    {
        int x;
        return foo(forward!args[3], forward!args[2], 1, forward!args[1], forward!args[0], x);
    }

    struct S {}
    S makeS(){ return S(); }
    int n;
    string s;
    assert(bar(S(), makeS(), n, s) == "RRLL");
    assert(baz(S(), makeS(), n, s) == "LLRRRL");
}

@safe unittest
{
    ref int foo(return ref int a) { return a; }
    ref int bar(Args)(auto ref Args args)
    {
        return foo(forward!args);
    }
    static assert(!__traits(compiles, { auto x1 = bar(3); })); // case of NG
    int value = 3;
    auto x2 = bar(value); // case of OK
}
