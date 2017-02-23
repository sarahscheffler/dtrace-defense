/* THIS NEVER WORKED */
syscall::read:entry
/execname == "echo"/
{
    self->t = timestamp;
}

syscall::read:return
/self->t != 0/
{
    printf("%d/%d spent %d nsecs in read(2)\n", pid, tid, timestamp - self->t);
    self->t = 0 /* reclaim mem */
}
