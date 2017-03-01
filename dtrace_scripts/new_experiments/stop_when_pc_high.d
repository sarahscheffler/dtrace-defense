#pragma D option destructive

fbt::amd64_syscall:
/ execname=="bufferover" && uregs[R_PC]>0x7f0000000000 /
{
    printf("\nProgram counter was %x, quitting.\n", uregs[R_PC]);
    raise(9); /* terminate process with SIGKILL */
}


