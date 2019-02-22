using Gee;

namespace Color {
    public errordomain KindMismatchError {
        DeviceProfile
    }
    public errordomain NotFoundError {
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

        /* Fields */
        private static org.freedesktop.ColorManager d_cm;
        private static ArrayList<Device> devices = new ArrayList<Device>();
        private static ArrayList<Profile> profiles = new ArrayList<Profile>();

        /* static initializer */
        static construct {
            //stdout.printf ("ColorManager init invoked.\n");

            try {
                d_cm = Bus.get_proxy_sync(
                    BusType.SYSTEM, // bus
                    "org.freedesktop.ColorManager", // interface
                    "/org/freedesktop/ColorManager" // objectpath
                );

                on_change(); // fire on_change "manually" to initially fill arrays etc.
                d_cm.changed.connect(on_change); // connect our on_change method to dbus change signal
            } catch (IOError e) {
                critical("Couldn't initialize ColorD: IOError: " + e.message);
            } catch (DBusError e) {
                critical("Couldn't initialize ColorD: DBusError: " + e.message);
            }
        }

        /* Constructor */
        public ColorManager() {
        }


        /* Methods */

        /* Returns string representation of this object.
         * @returns string
         */
        public string to_string() {
            string version = d_cm.daemon_version.to_string();
            string model = d_cm.system_model.to_string();
            string vendor = d_cm.system_vendor.to_string();

            return "colord.ColorManager ver:%s model:%s vendor:%s".printf(version, model, vendor);
        }


        /**
         * This is connected to the change-signal of the dbus-api.
         * It reloads all devices and profiles
         * (there are not that many so we just reload all, and not only the
         * new/changed things)
         *
         */
        private static void on_change()  {
            // reload all devices and profiles.
            try {
                // get_devices
                devices.clear();

                var cm_devices = d_cm.get_devices();

                foreach (var device_op in cm_devices) {
                    var device = new Device(device_op);
                    devices.add(device);
                    //stdout.printf(" Found Device %s\n", device.to_string());
                }

                // get_profiles
                profiles.clear();

                var cm_profiles = d_cm.get_profiles();

                foreach (var profile_op in cm_profiles) {
                    var profile = new Profile(profile_op);
                    profiles.add(profile);
                    //stdout.printf(" Found Profile %s\n", profile.to_string());
                }
            } catch (IOError e) {
                warning("IOError in ColorManager.on_change: " + e.message);
            } catch (DBusError e) {
                warning("DBusError in ColorManager.on_change: " + e.message);

            }
        }


        /**
         * Get's an ArrayList of all devices.
         *
         * @return list of all devices.
         */
        public ArrayList<Device> getDevices() throws IOError, DBusError {
            return devices;
        }

        /* Try's to find the Device-instance for a given ObjectPath.
         *
         * @return Device-instance for ObjectPath
         * @throws NotFoundError.Device if no corresponding Device is found
         */
        public Device getDevice(ObjectPath op) throws NotFoundError {
            foreach (Device d in devices) {
                if (d.get_objectpath() == op) {
                    return d;
                }
            }
            throw new NotFoundError.Device("No Device-instance found for ObjectPath " + op.to_string());
        }


        /**
         * Get's an ArrayList of all profiles.
         *
         * @return list of all profiles.
         */
        public ArrayList<Profile> getProfiles() throws IOError, DBusError {
            ArrayList<Profile> ret_profiles = new ArrayList<Profile>();

            var profiles = d_cm.get_profiles();

            foreach (var objpath_profile in profiles) {
                var new_profile = new Profile(objpath_profile);
                ret_profiles.add(new_profile);
            }

            return ret_profiles;
        }

        /* Try's to find the Profile-instance for a given ObjectPath.
         *
         * @return Profile-instance for ObjectPath
         * @throws NotFoundError.Profile if no corresponding Profile is found
         */
        public static Profile getProfile(ObjectPath op) throws NotFoundError {
            foreach (Profile p in profiles) {
                if (p.get_objectpath() == op) {
                    return p;
                }
            }
            throw new NotFoundError.Profile("No Profile-instance found for ObjectPath " + op.to_string());
        }


    }






}
