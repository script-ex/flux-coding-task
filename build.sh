#!/bin/bash
set -euxo pipefail

c++ -Wall -Wextra -Werror -std=c++17 original.cpp     -o bin/original

c++ -Wall -Werror -Wextra -std=c++17 your_version.cpp -o bin/your_version
