:::entry
/execname == "bufferover"/
{
    size = 32; /* this is wrong */
    printf("\nentry: %s\n", execname);
    printf("    %s:%s:%s:%s\n", probeprov, probename, probemod, probefunc);
    printf("    write arg: %s\n", stringof(copyin(arg1, size)));
}

:::return
/execname == "bufferover"/
{
    printf("\nreturn: %s\n", execname);
    printf("    %s:%s:%s:%s\n", probeprov, probename, probemod, probefunc);
}
