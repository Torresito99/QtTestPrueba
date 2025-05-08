cmake_minimum_required(VERSION 3.16)

project(loginQMLapp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

enable_testing()

find_package(Qt6 REQUIRED COMPONENTS Quick QuickTest)

qt_standard_project_setup(REQUIRES 6.5)

add_executable(tst_login
    tst_login.cpp
)

add_test(NAME tst_login COMMAND tst_login)

qt6_add_qml_module(tst_login
    URI loginQMLapp
    VERSION 1.0
    QML_FILES
        Main.qml
        tst_login.qml
    RESOURCES
        test_data.json
    SOURCES
        tst_login.cpp
)

target_link_libraries(tst_login
    PRIVATE Qt6::Quick
    PRIVATE Qt6::QuickTest
)
