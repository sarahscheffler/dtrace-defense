#pragma D option destructive

long minsp;

dtrace:::BEGIN
{
    /* Initialize minsp to max_long_int */
    self->minsp = 0xffffffffffffffff;
}

proc:::exec-success
/ execname=="bufferover" /
{
    /* Re-initialize minsp */
    printf("\n        Reinitializing minsp");
    self->minsp = 0xffffffffffffffff;
}


syscall:::entry
/ execname=="bufferover" && uregs[R_SP] < self->minsp /
{
    /* Keep minsp variable updated */
    printf("\n        Moving minsp to %x", uregs[R_SP]);
    self->minsp = uregs[R_SP];
}

syscall:::entry
/ execname=="bufferover" && self->minsp < uregs[R_PC] /
{
    printf("\n        Program counter was %x, (exceeded %x), quitting.", uregs[R_PC], uregs[R_SP]);
    raise(9);
}

