syscall:::entry
/execname=="bufferover"/
{
	printf("\n");
	printf("rip: %x\n", uregs[R_RIP]);
	printf("rsp: %x\n", uregs[R_RSP]);
	printf("rbp: %x\n", uregs[R_RBP]);
	printf("pc: %x\n", uregs[R_PC]);
	printf("sp: %x\n", uregs[R_SP]);
	printf("eip: %x\n", uregs[R_EIP]);
}

