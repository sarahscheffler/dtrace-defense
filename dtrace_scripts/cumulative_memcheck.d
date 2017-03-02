self unsigned long totalmem;

proc:::exec-success
{
    /* Initializing memory variable for this process */
    self->totalmem = 0;
}

/* pid$target::free:return
/ execname!="dtrace" / 
{} */

fbt::malloc:entry
/ execname!="dtrace" && self->totalmem + (unsigned long) arg0 <= 1048576 /
{
    /* Add memory used */
    self->totalmem += (unsigned long) arg0;
    printf("totalmem for pid %d is now %lu", pid, self->totalmem);
}

fbt::calloc:entry,
fbt::realloc:entry
/ execname!="dtrace" && self->totalmem + (unsigned long) arg1 <= 1048576 /
{
    /* Add memory used */
    self->totalmem += (unsigned long) arg1;
    printf("totalmem for pid %d is now %lu", pid, self->totalmem);
}

fbt::malloc:entry
/ execname!="dtrace" && self->totalmem + (unsigned long)arg0 > 1048576 /
{
    self->totalmem += (unsigned long) arg0;
	printf("\nAllocated memory using %s is more than 100MB (%lu) for process %d\n", probefunc, self->totalmem, $pid);
}

fbt::calloc:entry,
fbt::realloc:entry
/ execname!="dtrace" && self->totalmem + (unsigned long)arg1 > 1048576 /
{
    self->totalmem += (unsigned long) arg1;
	printf("\nAllocated memory using %s is more than 100MB (%x) for process %d\n", probefunc, self->totalmem, $pid);
}

