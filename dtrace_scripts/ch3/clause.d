int me;
this int foo;

tick-1
{
    /* set foot o 10 iff this is 1st clause */
    this->foo = (me % 3 == 0) ? 10 : this->foo;
    printf("Clause 1 is number %d; foo is %d\n", me++ %3, this->foo++);
}

tick-1
{
    /* set foot o 10 iff this is 1st clause */
    this->foo = (me % 3 == 0) ? 20 : this->foo;
    printf("Clause 2 is number %d; foo is %d\n", me++ %3, this->foo++);
}

tick-1
{
    /* set foot o 10 iff this is 1st clause */
    this->foo = (me % 3 == 0) ? 30 : this->foo;
    printf("Clause 3 is number %d; foo is %d\n", me++ %3, this->foo++);
}
