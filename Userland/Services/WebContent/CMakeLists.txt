serenity_component(
    WebContent
    TARGETS WebContent
)

compile_ipc(WebContentServer.ipc WebContentServerEndpoint.h)
compile_ipc(WebContentClient.ipc WebContentClientEndpoint.h)

set(SOURCES
    ClientConnection.cpp
    ConsoleGlobalObject.cpp
    main.cpp
    PageHost.cpp
    WebContentConsoleClient.cpp
    WebContentServerEndpoint.h
    WebContentClientEndpoint.h
)

serenity_bin(WebContent)
target_link_libraries(WebContent LibCore LibIPC LibGfx LibWeb)
