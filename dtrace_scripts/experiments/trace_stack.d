string currstack;

syscall:::entry
/execname == "bufferover"/
{
    printf("\nSP: %x\nPC: %x\nBP: %x\n", uregs[R_SP], uregs[R_PC], uregs[R_RBP]);
    currstack = ustack(100);
    /* @[ustack()] = count(); */
}

