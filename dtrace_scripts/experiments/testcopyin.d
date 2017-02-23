syscall::write:entry
/execname != "dtrace" && execname != "tee"/
{
    size = 32; /* this is wrong */
    printf("\nwrite entry: %s\n", execname);
    printf("write arg: %s\n", stringof(copyin(arg1, size)));
}

syscall::write:return
/execname != "dtrace" && execname != "tee"/
{
    printf("\nwrite return: %s\n", execname);
}
