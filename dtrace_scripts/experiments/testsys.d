syscall:::entry
/execname != "dtrace" && execname != "tee" && execname != "tmux" && execname != "sshd"/
{
    size = 32; /* this is wrong */
    printf("\nwrite entry: %s\n", execname);
    printf("write arg: %s\n", stringof(copyin(arg1, size)));
}

syscall:::return
/execname != "dtrace" && execname != "tee" && execname != "tmux" && execname != "sshd"/
{
    printf("\nwrite return: %s\n", execname);
}
