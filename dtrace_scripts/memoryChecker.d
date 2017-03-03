::malloc:entry
/ arg0 > 104857600 /
{
	printf("\nAllocated memory using %s is %d which is more than 100MB for process %d.\n", probefunc, arg0, $pid);
}

::calloc:entry,
::realloc:entry
/ arg1 > 104857600 /
{
	printf("\nAllocated memory using %s is %d which is more than 100MB for process %d.\n", probefunc, arg1, $pid);
}

