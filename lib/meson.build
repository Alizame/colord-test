lib_files = files(
    'ColorManager/ColorManagerDbus/ColorManagerDbus.vala',

    'ColorManager/ColorManager.vala',
    'ColorManager/Device.vala',
    'ColorManager/Profile.vala',
)

lib_deps = [
    gio_dep,
    gee_dep
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
