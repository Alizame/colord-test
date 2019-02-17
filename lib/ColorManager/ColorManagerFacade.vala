using Gee;

namespace lib {
    public class ColorManager : Object {
        /* A facade for the ColorD Dbus API.
         *
         * Acts a bit like an interface, so if the apocalypse happens
         * and colord is replaced by something else, we only need to
         * adapt these classes.
         *
         */


        private org.freedesktop.ColorManager d_cm;
        //private ArrayList<org.freedesktop.Device> d_devices = new ArrayList<org.freedesktop.Device>();
        //private ArrayList<org.freedesktop.Profile> d_profiles = new ArrayList<org.freedesktop.Profile>();

        public string to_string() {
            string version = d_cm.daemon_version.to_string();
            string model = d_cm.system_model.to_string();
            string vendor = d_cm.system_vendor.to_string();

            return "[colord.ColorManager ver:%s model:%s vendor:%s]".printf(version, model, vendor);
        }

        public org.freedesktop.ColorManager get_d_cm() {
            return this.d_cm;
        }

        public ColorManager() throws IOError {
            this.d_cm = Bus.get_proxy_sync(
                BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                "/org/freedesktop/ColorManager" // objectpath
            );


            /* device kinds:
             *    display
             *    scanner
             *    printer
             *    camera
             * and that should be all?
             */
        }

        public ArrayList<Device> getDevices() throws IOError, DBusError {
            ArrayList<Device> ret_devices = new ArrayList<Device>();

            var devices = this.d_cm.get_devices();

            foreach (var objpath_device in devices) {
                var new_device = new Device(objpath_device);
                ret_devices.add(new_device);
            }

            return ret_devices;
        }

        public ArrayList<Profile> getProfiles() throws IOError, DBusError {
            ArrayList<Profile> ret_profiles = new ArrayList<Profile>();

            var profiles = this.d_cm.get_profiles();

            foreach (var objpath_profile in profiles) {
                var new_profile = new Profile(objpath_profile);
                ret_profiles.add(new_profile);
            }

            return ret_profiles;
        }

        // DeleteProfile useful here?

    }

    errordomain KindMismatch {
        DeviceProfile
    }

    public class Device : Object {
        private ObjectPath path;
        private org.freedesktop.Device d;

        private bool enabled; // these are all attributes allc
        private string kind;
        private string vendor;
        private string model;
        private string serial;
        private string device_id;

        public string to_string() {
            return " %s: %s %s - %s - %s".printf(kind, vendor, model, serial, device_id);

        }
        public ObjectPath get_objectpath() {
            return this.path;
        }

        public Device(ObjectPath path) throws IOError {
            this.path = path;

            this.d = Bus.get_proxy_sync(
            BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                this.path // objpath
            );

            this.kind = this.d.kind;
            this.vendor = this.d.vendor;
            this.model = this.d.model;
            this.serial = this.d.serial;
            this.device_id = this.d.device_id;
            this.enabled = this.d.enabled;

            on_change();
            d.changed.connect(on_change); // connect our on_change method to dbus change signal
        }
        private void on_change() {
            // reload all devices and profiles.
            warning("changed() not implemented yet.");
            // get_devices
            // get_profiles
        }

        public void addProfile(Profile p) throws Error {
            // this is user-defined, so it is always a "hard" relation.
            this.d.add_profile("hard", p.get_objectpath());
            // assert profile.kind == device.kind

        }

        public void removeProfile(Profile p) {

        }

        public void setDefaultProfile(Profile p) {

        }
    }

    public class Profile : Object {
        private ObjectPath path;
        private org.freedesktop.Profile d;

        private string kind;
        private string title;

        public string to_string() {
            return " %s: %s".printf(kind, title);
        }

        public ObjectPath get_objectpath() {
            return this.path;
        }
        public string get_kind() {
            return this.kind;
        }
        public string get_title() {
            return this.title;
        }


        public Profile(ObjectPath path) throws IOError {
            this.path = path;

            this.d = Bus.get_proxy_sync(
            BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                this.path // objpath
            );

            this.kind = this.d.kind;
            this.title = this.d.title;
        }
    }


}




