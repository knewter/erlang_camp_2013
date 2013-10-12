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

#### Running nodes and chatting on a network

In two different shells:

```bash
erl -name a  # Fully qualified domain name
erl -sname b # non fully qualified name
```

That will spin up two named erlang shells.  One is on the local machine, one is
on the network (a is network, b is local).

Then from a:

```erlang
net_adm:ping(b@network).
```

You'll get a pong back from b.

#### EPMD Port Mapper Daemon
This process maps node names to the ports they listen to.  There is one per
machine.  Listens on port 4369.

#### Connecting to other nodes

Start nodes a and b.

In a:

- `net_adm:ping(b@jibbajabba).`
- ^G - This will open 'User switch command'
- ? - This will yield help
- r b@jibbajabba - start remote shell
- j - list jobs
- c - connect to a job

Now you're on the b node, connected from the shell you started from the a node
:)

#### 8 Fallacies of Distributed Computing
Keep these in mind as you code:

- Network is reliable
- Latency is zero
- Bandwidth is infinite
- Topology does not change
- There is one administrator
- Transport cost is zero
- Network is homogenous

#### Healthy Properties
These properties are present in the most sound of distributed systems.

- Peer Based - No leader, masters, special nodes or central services
- Asynchronous - Resilient, expect failure, simple, loosely coupled
- Easy to debug - Easy to interrogate, easy to determine state
