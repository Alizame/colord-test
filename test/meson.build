test_deps = [
    lib_dep,
    gio_dep,
    granite_dep,
    colord_dep,
    colord_gtk_dep,
]

test('colord-test UnitTest',
    executable(
        'UnitTest',
        'UnitTest.vala',
        dependencies: test_deps
    )
)

test('colord-test DBus_initialisation',
    executable(
        'DBus_initialisation',
        'DBus_initialisation.vala',
        dependencies: test_deps
    )
)
