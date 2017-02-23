syscall::read:return,
syscall::write:return
/execname=="bufferover"/
{
    printf("\n");
	printf("rsp: %x\n", uregs[R_RSP]);
	printf("rbp: %x\n", uregs[R_RBP]);
	printf("rip: %x", uregs[R_RIP]);
}

