# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/doutorado/HetMUAVNet

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/doutorado/HetMUAVNet

# Include any dependencies generated for this target.
include src/gzuavchannel/CMakeFiles/gzuavchannel.dir/depend.make

# Include the progress variables for this target.
include src/gzuavchannel/CMakeFiles/gzuavchannel.dir/progress.make

# Include the compile flags for this target's objects.
include src/gzuavchannel/CMakeFiles/gzuavchannel.dir/flags.make

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/main.cpp.o: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/flags.make
src/gzuavchannel/CMakeFiles/gzuavchannel.dir/main.cpp.o: src/gzuavchannel/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/gzuavchannel/CMakeFiles/gzuavchannel.dir/main.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gzuavchannel.dir/main.cpp.o -c /home/doutorado/HetMUAVNet/src/gzuavchannel/main.cpp

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gzuavchannel.dir/main.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/gzuavchannel/main.cpp > CMakeFiles/gzuavchannel.dir/main.cpp.i

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gzuavchannel.dir/main.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/gzuavchannel/main.cpp -o CMakeFiles/gzuavchannel.dir/main.cpp.s

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.o: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/flags.make
src/gzuavchannel/CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.o: src/gzuavchannel/CommandLineParser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/gzuavchannel/CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.o -c /home/doutorado/HetMUAVNet/src/gzuavchannel/CommandLineParser.cpp

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/gzuavchannel/CommandLineParser.cpp > CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.i

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/gzuavchannel/CommandLineParser.cpp -o CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.s

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.o: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/flags.make
src/gzuavchannel/CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.o: src/gzuavchannel/ExternalSyncServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/gzuavchannel/CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.o -c /home/doutorado/HetMUAVNet/src/gzuavchannel/ExternalSyncServer.cpp

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/gzuavchannel/ExternalSyncServer.cpp > CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.i

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/gzuavchannel/ExternalSyncServer.cpp -o CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.s

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.o: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/flags.make
src/gzuavchannel/CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.o: src/gzuavchannel/TCPTransport.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/gzuavchannel/CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.o -c /home/doutorado/HetMUAVNet/src/gzuavchannel/TCPTransport.cpp

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/gzuavchannel/TCPTransport.cpp > CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.i

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/gzuavchannel/TCPTransport.cpp -o CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.s

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/Transport.cpp.o: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/flags.make
src/gzuavchannel/CMakeFiles/gzuavchannel.dir/Transport.cpp.o: src/gzuavchannel/Transport.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/gzuavchannel/CMakeFiles/gzuavchannel.dir/Transport.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gzuavchannel.dir/Transport.cpp.o -c /home/doutorado/HetMUAVNet/src/gzuavchannel/Transport.cpp

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/Transport.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gzuavchannel.dir/Transport.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/gzuavchannel/Transport.cpp > CMakeFiles/gzuavchannel.dir/Transport.cpp.i

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/Transport.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gzuavchannel.dir/Transport.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/gzuavchannel/Transport.cpp -o CMakeFiles/gzuavchannel.dir/Transport.cpp.s

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.o: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/flags.make
src/gzuavchannel/CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.o: src/gzuavchannel/UDSTransport.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/gzuavchannel/CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.o -c /home/doutorado/HetMUAVNet/src/gzuavchannel/UDSTransport.cpp

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/gzuavchannel/UDSTransport.cpp > CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.i

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/gzuavchannel/UDSTransport.cpp -o CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.s

# Object files for target gzuavchannel
gzuavchannel_OBJECTS = \
"CMakeFiles/gzuavchannel.dir/main.cpp.o" \
"CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.o" \
"CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.o" \
"CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.o" \
"CMakeFiles/gzuavchannel.dir/Transport.cpp.o" \
"CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.o"

# External object files for target gzuavchannel
gzuavchannel_EXTERNAL_OBJECTS =

src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/main.cpp.o
src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/CommandLineParser.cpp.o
src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/ExternalSyncServer.cpp.o
src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/TCPTransport.cpp.o
src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/Transport.cpp.o
src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/UDSTransport.cpp.o
src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/build.make
src/gzuavchannel/gzuavchannel: src/libs/liblibs.a
src/gzuavchannel/gzuavchannel: src/gzuavchannel/CMakeFiles/gzuavchannel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable gzuavchannel"
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gzuavchannel.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/gzuavchannel/CMakeFiles/gzuavchannel.dir/build: src/gzuavchannel/gzuavchannel

.PHONY : src/gzuavchannel/CMakeFiles/gzuavchannel.dir/build

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/clean:
	cd /home/doutorado/HetMUAVNet/src/gzuavchannel && $(CMAKE_COMMAND) -P CMakeFiles/gzuavchannel.dir/cmake_clean.cmake
.PHONY : src/gzuavchannel/CMakeFiles/gzuavchannel.dir/clean

src/gzuavchannel/CMakeFiles/gzuavchannel.dir/depend:
	cd /home/doutorado/HetMUAVNet && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/doutorado/HetMUAVNet /home/doutorado/HetMUAVNet/src/gzuavchannel /home/doutorado/HetMUAVNet /home/doutorado/HetMUAVNet/src/gzuavchannel /home/doutorado/HetMUAVNet/src/gzuavchannel/CMakeFiles/gzuavchannel.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gzuavchannel/CMakeFiles/gzuavchannel.dir/depend

