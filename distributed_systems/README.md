# Distributed Systems

## Message Passing
- Shared Nothing, Copy Everything
- Mailboxes

### Open a shell
    1> self() ! hello.
    2> receive X -> X end.

### Pulling a second msg
    3> self() ! hello.
    3> self() ! bye.
    4> receive
         Msg -> Msg
       after
         0 > nope
       end.

### Processes and pids
    30> Shell = self().
    <0.33.0>
    31> Pid = spawn(fun() -> Shell ! self() end).
    <0.70.0>
    32> Pid2 = spawn(fun() -> Shell ! self() end).
    <0.72.0>
    33> receive Pid -> Pid after 0 -> nope end.
    <0.70.0>
    34> receive Pid -> Pid after 0 -> nope end.
    nope
