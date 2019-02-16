lib_files = files(
    'ColorManager/ColorManagerDbus/ColorManagerDbus.vala',
    'ColorManager/ColorManagerFacade.vala',
)

lib_deps = [
    gio_dep,
    dependency('gee-0.8', version: '>=0.20.1')
]

lib_library = shared_library(
    'colord-lib-1.0',
    lib_files,
    dependencies: lib_deps,
    install : true
)

lib_dep = declare_dependency(
    dependencies: lib_deps,
    link_with: lib_library,
    include_directories: include_directories('.')
)
