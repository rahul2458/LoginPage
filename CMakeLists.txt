cmake_minimum_required(VERSION 3.16)

project(TestinCpp_And_QML1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appTestinCpp_And_QML1
    main.cpp
)

qt_add_qml_module(appTestinCpp_And_QML1
    URI TestinCpp_And_QML1
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES CstmButton.qml
    RESOURCES "Resources/Images/road-1072823_1280.jpg"
    RESOURCES "Resources/Icons/icons8_horizontal_line_30px.png"
    RESOURCES "Resources/Images/1677420534414.jpg"
    RESOURCES "Resources/Images/Me1.png"
    RESOURCES "Resources/Icons/icons8_Facebook_24px.png"
    RESOURCES "Resources/Icons/icons8_linkedin_circled_50px.png"
    RESOURCES "Resources/Icons/icons8_google_plus_24px.png"
    RESOURCES "Resources/Icons/icons8_Twitter_24px.png"
    RESOURCES "Resources/Icons/icons8_Close_24px.png"
    RESOURCES "Resources/Icons/icons8_YouTube_24px.png"
    QML_FILES CstmInputText.qml
    QML_FILES CstmRoundBt.qml
    QML_FILES Global_property.qml
    SOURCES backendcpp.h backendcpp.cpp

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTestinCpp_And_QML1 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTestinCpp_And_QML1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTestinCpp_And_QML1
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTestinCpp_And_QML1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
