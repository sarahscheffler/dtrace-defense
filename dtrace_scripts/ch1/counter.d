/* Count and report number of seconds elapsed */
dtrace:::BEGIN
{
    i = 0;
}

profile:::tick-1
{
    i = i + 1;
    trace(i);
}

dtrace:::END
{
    trace(i);
}

