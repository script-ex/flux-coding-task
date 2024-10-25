# Flux Coding Task

The `original.cpp` file contains a segment of code designed for a commonly used microcontroller. This code, while functional, could benefit from some refactoring for improved maintainability. To simplify the process, we've provided stubs for all necessary library functions in `libs.hpp` and modified the code to compile as standard C++ 17.

Your task is to refactor this code, making it more maintainable and readable. Feel free to utilize any aspects of the language and standard library that you deem appropriate. You can also modify the structure and naming conventions of the code as you see fit. For this exercise, even minor behavioral modifications that don't significantly affect the user experience are considered part of the refactoring process. In terms of efficiency, you can assume that the code will be running on standard desktop-class hardware.

The program assumes that an LCD is connected to the microcontroller, which is controlled by the `LiquidCrystal` class. This class is initialized with the numbers of the relevant pins on the chip. You can treat this numbering as opaque and use the provided values.

The program also assumes that a set of buttons is connected on pin 0, which the user can press to change the selected menu item.

The toolchain requires the definition of two functions: `void setup()`, which is called once at initialization, and `void loop()`, which is called repeatedly after setup. Since these calls are usually handled by the platform, we've added a `main()` function to perform the same task. Please maintain this structure.

You should write your code in `your_version.cpp`. You can build your code using the `build.sh` script, which includes the minimum warnings we'd like to use. Please ensure that the build is clean under at least these flags.

A Ruby version of this task is also available in the `/ruby` folder.

If you have any questions or need clarification, please don't hesitate to contact us. You can email `wojtek@fluxinc.co` with the subject line starting with "CODE TEST ADVICE" to ensure we see your message promptly.
