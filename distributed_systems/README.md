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

### Try this!
- spawn a process
- send that process a message containing the Pid of the shell
- have that process send you back its Pid
- receive that message out of the shell's mailbox

    37> Pid = spawn(fun() -> receive Shell -> Shell ! {echo, self()} end end).
    <0.78.0>
    38> Pid ! self().
    <0.33.0>
    39> receive Pid -> Pid after 0 -> nope end.
    nope
    40> receive {echo, Pid} -> Pid after 0 -> nope end.
    <0.33.0>

- Chain some stuff :)

    5> Fun = 
    5>   fun() -> 
    5>     receive From -> From ! self() end
    5>   end.
    #Fun<erl_eval.20.80484245>
    6> Pid1 = spawn(Fun).
    <0.41.0>
    7> Pid2 = spawn(Fun).
    <0.43.0>
    8> Pid3 = spawn(Fun).
    <0.45.0>
    9> Pid1 ! Pid2 ! Pid3 ! self().
    <0.33.0>
    10> flush().
    Shell got <0.45.0>
    Shell got <0.43.0>
    Shell got <0.41.0>
    ok

### Location Transparency

Syntax is the same whether talking to a local process or one that is on another
machine.

- Local process communication
  - `Pid ! message`
- Remote process communication
  - `Pid ! message`


