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
include src/libs/CMakeFiles/libs.dir/depend.make

# Include the progress variables for this target.
include src/libs/CMakeFiles/libs.dir/progress.make

# Include the compile flags for this target's objects.
include src/libs/CMakeFiles/libs.dir/flags.make

src/libs/CMakeFiles/libs.dir/IO/Poll.cpp.o: src/libs/CMakeFiles/libs.dir/flags.make
src/libs/CMakeFiles/libs.dir/IO/Poll.cpp.o: src/libs/IO/Poll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/libs/CMakeFiles/libs.dir/IO/Poll.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/libs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libs.dir/IO/Poll.cpp.o -c /home/doutorado/HetMUAVNet/src/libs/IO/Poll.cpp

src/libs/CMakeFiles/libs.dir/IO/Poll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libs.dir/IO/Poll.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/libs/IO/Poll.cpp > CMakeFiles/libs.dir/IO/Poll.cpp.i

src/libs/CMakeFiles/libs.dir/IO/Poll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libs.dir/IO/Poll.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/libs/IO/Poll.cpp -o CMakeFiles/libs.dir/IO/Poll.cpp.s

src/libs/CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.o: src/libs/CMakeFiles/libs.dir/flags.make
src/libs/CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.o: src/libs/MAVLink/MAVLink.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/libs/CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/libs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.o -c /home/doutorado/HetMUAVNet/src/libs/MAVLink/MAVLink.cpp

src/libs/CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/libs/MAVLink/MAVLink.cpp > CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.i

src/libs/CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/libs/MAVLink/MAVLink.cpp -o CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.s

# Object files for target libs
libs_OBJECTS = \
"CMakeFiles/libs.dir/IO/Poll.cpp.o" \
"CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.o"

# External object files for target libs
libs_EXTERNAL_OBJECTS =

src/libs/liblibs.a: src/libs/CMakeFiles/libs.dir/IO/Poll.cpp.o
src/libs/liblibs.a: src/libs/CMakeFiles/libs.dir/MAVLink/MAVLink.cpp.o
src/libs/liblibs.a: src/libs/CMakeFiles/libs.dir/build.make
src/libs/liblibs.a: src/libs/CMakeFiles/libs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library liblibs.a"
	cd /home/doutorado/HetMUAVNet/src/libs && $(CMAKE_COMMAND) -P CMakeFiles/libs.dir/cmake_clean_target.cmake
	cd /home/doutorado/HetMUAVNet/src/libs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libs/CMakeFiles/libs.dir/build: src/libs/liblibs.a

.PHONY : src/libs/CMakeFiles/libs.dir/build

src/libs/CMakeFiles/libs.dir/clean:
	cd /home/doutorado/HetMUAVNet/src/libs && $(CMAKE_COMMAND) -P CMakeFiles/libs.dir/cmake_clean.cmake
.PHONY : src/libs/CMakeFiles/libs.dir/clean

src/libs/CMakeFiles/libs.dir/depend:
	cd /home/doutorado/HetMUAVNet && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/doutorado/HetMUAVNet /home/doutorado/HetMUAVNet/src/libs /home/doutorado/HetMUAVNet /home/doutorado/HetMUAVNet/src/libs /home/doutorado/HetMUAVNet/src/libs/CMakeFiles/libs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libs/CMakeFiles/libs.dir/depend
