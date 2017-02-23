syscall::write:entry
/execname != "dtrace"/
{
    printf("we: %s\n", execname);
}

syscall::write:return
/execname != "dtrace"/
{
    printf("wr: %s\n", execname);
}
