import os

# NOTE: the following paths are filled at installation time by cmake
_install_prefix = os.path.join(os.path.dirname(__file__), "../../../")
LIBEXECDIR = os.path.abspath(os.path.join(_install_prefix, "libexec"))
SHAREDIR = os.path.abspath(os.path.join(_install_prefix, "share"))
