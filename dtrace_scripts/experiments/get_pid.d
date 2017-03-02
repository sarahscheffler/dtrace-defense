#pragma D option destructive

proc:::exec-success
/execname=="bufferover"/
{
    trace(pid);
    stop();
}
