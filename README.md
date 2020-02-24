# Initialization of a new Ubuntu environment

### solution to 'command not found' for files installed by snap*

The snap binary and desktop directories will not automatically be added to your environment variables. In order to solve this, I added the following line to /etc/zsh/zprofile:

```
emulate sh -c 'source /etc/profile'
```
