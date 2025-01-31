cmake_minimum_required(VERSION 3.30)
project(ViscosimeterApp LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Quick3D Widgets Pdf)

include_directories("include")
file(GLOB_RECURSE SOURCES "src/*.cpp")
file(GLOB_RECURSE HEADERS "include/*.hpp" "include/*.h")
qt_add_resources(SOURCES resources/resources.qrc)
qt_add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Core Qt6::Gui Qt6::Quick Qt6::Quick3D Qt6::Widgets)

set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE ON
    MACOSX_BUNDLE ON
)
