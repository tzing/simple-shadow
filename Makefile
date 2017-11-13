SRCS:=main.cpp

OS=$(shell uname)

ifeq ($(OS),Darwin)
	LIBS+= -framework OpenGL -framework GLUT
else
	LIBS+= -lGL -lGLU -lglut
endif

OBJS=$(subst .cpp,.o,$(SRCS))
RM=rm -f

all: shadow

%.o: %.cpp
	$(CXX) $(CFLAGS) $(LIBS) -c $<

shadow: $(OBJS)
	$(CXX) $(LIBS) -o $@ $(OBJS)

.PHONY: all clean cleanall

clean:
	$(RM) $(OBJS)

cleanall: clean
	$(RM) shadow
