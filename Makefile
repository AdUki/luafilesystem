# $Id: Makefile,v 1.36 2009/09/21 17:02:44 mascarenhas Exp $

T= lfs

CONFIG= ./config

# System's libraries directory (where binary libraries are installed)
LUA_LIBDIR= ../LuaJIT-2.0.2/src

# Lua includes directory
LUA_INC= ../LuaJIT-2.0.2/src

# OS dependent
LIB_OPTION= -shared -L $(LUA_LIBDIR) -llua51
#LIB_OPTION= -bundle -undefined dynamic_lookup #for MacOS X

LIBNAME= $T.dll

# Compilation directives
WARN= -O2 -Wall -fPIC -W -Waggregate-return -Wcast-align -Wmissing-prototypes -Wnested-externs -Wshadow -Wwrite-strings -pedantic
INCS= -I$(LUA_INC)
CFLAGS= $(WARN) $(INCS)
CC= gcc

SRCS= src/$T.c
OBJS= src/$T.o

lib: src/lfs.dll

src/lfs.dll: $(OBJS)
	$(CC) $(CFLAGS) $(LIB_OPTION) -o src/lfs.dll $(OBJS)

clean:
	rm -f src/lfs.dll $(OBJS)