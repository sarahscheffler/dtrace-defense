dtrace:::BEGIN
{
    i = 10;
}

profile:::tick-1
/i > 0/
{
    trace(i--);
}

profile:::tick-1
/i == 0/
{
    trace("blast off");
    exit(0);
}

