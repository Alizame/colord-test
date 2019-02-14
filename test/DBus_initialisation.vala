using Gee;

class DBus_initialisation : GLib.Object {
    public static int main(string[] args) {
        assert(true);

        try {

            org.freedesktop.ColorManager cm = Bus.get_proxy_sync(
                BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                "/org/freedesktop/ColorManager" // objectpath
            );

            assert(cm.daemon_version != null);
            assert(cm.system_model != null);
            assert(cm.system_vendor != null);
        }
        catch (IOError e) {
            error(e.message);
        }

        return 0;
    }
}

