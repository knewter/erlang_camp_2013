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
