::malloc:entry
/ arg0 > 1048576 /
{
	printf("\nAllocated memory using malloc is more than 100MB for process %d.\n", $pid);
}

::calloc:entry
/ arg1 > 1048576 /
{
	printf("\nAllocated memory using calloc is more than 100MB for process %d.\n", $pid);
}

::realloc:entry
/ arg1 > 1048576 /
{
	printf("\nAllocated memory using realloc is more than 100MB for process %d.\n", $pid);
}

