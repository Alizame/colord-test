using Gee;

namespace ColorManager {
    errordomain KindMismatch {
        DeviceProfile
    }

    errordomain NotFound {
        Device,
        Profile
    }

    public class ColorManager : Object {
        /* A facade for the ColorD Dbus API.
         *
         * This is an abstraction layer for the colord-dbus-api,
         * so if the apocalypse happens and colord is replaced by something else,
         * we only need to adapt these classes.
         *
         */


        private org.freedesktop.ColorManager d_cm;
        private ArrayList<Device> devices;
        private ArrayList<Profile> profiles;

        public string to_string() {
            string version = d_cm.daemon_version.to_string();
            string model = d_cm.system_model.to_string();
            string vendor = d_cm.system_vendor.to_string();

            return "colord.ColorManager ver:%s model:%s vendor:%s".printf(version, model, vendor);
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

            on_change();
            d_cm.changed.connect(on_change); // connect our on_change method to dbus change signal
        }

        /**
         * This is connected to the change-signal of the dbus-api.
         * It reloads all devices and profiles
         * (there are not that many so we just reload all, and not only the
         * new/changed things)
         *
         */
        private void on_change() {
            // reload all devices and profiles.

            // get_devices
            this.devices = new ArrayList<Device>();

            var devices = this.d_cm.get_devices();

            foreach (var objpath_device in devices) {
                var new_device = new Device(objpath_device);
                this.devices.add(new_device);
            }

            // get_profiles
        }


        /**
         * Get's an ArrayList of all devices.
         *
         * @return list of all devices.
         */
        public ArrayList<Device> getDevices() throws IOError, DBusError {
            return this.devices;
        }

        /**
         * Get's an ArrayList of all profiles.
         *
         * @return list of all profiles.
         */
        public ArrayList<Profile> getProfiles() throws IOError, DBusError {
            ArrayList<Profile> ret_profiles = new ArrayList<Profile>();

            var profiles = this.d_cm.get_profiles();

            foreach (var objpath_profile in profiles) {
                var new_profile = new Profile(objpath_profile);
                ret_profiles.add(new_profile);
            }

            return ret_profiles;
        }



        public static Device getDevice(ObjectPath op) {
            return null;
        }
    }






}
