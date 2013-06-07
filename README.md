Configurator example
====================

Here is an example session:

```
$ ./configurator-example 
-> Config watcher thread id: ThreadId 2
-> Type 'show' or 'quit', and feel free to modify ex.cfg while this runs:
--- pos.y has been changed to: Just (Number (4 % 1)) ---
--- pos.y has been changed to: Nothing ---
--- pos.y has been changed to: Just (String "salut") ---
show
Just 2
Nothing
-> Type 'show' or 'quit', and feel free to modify ex.cfg while this runs:
--- pos.y has been changed to: Just (Number (1200 % 1)) ---
show
Just 2
Just 1200
-> Type 'show' or 'quit', and feel free to modify ex.cfg while this runs:
quit
```