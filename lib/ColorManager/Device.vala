using Gee;

namespace Color {


    public class Device : Object {

        /* device kinds: icon
        *    unknown : image-missing
        *    display : video-display
        *    scanner : scanner
        *    printer : document-print
        *    camera : camera-web
        * and that should be all?
        */
        public enum Kind {
            UNKNOWN,
            DISPLAY,
            SCANNER,
            PRINTER,
            CAMERA;

            //ToDo: needs to move into Application?+
            public string get_icon_str() {
                switch (this) {
                    case UNKNOWN:
                        return "image-missing";
                    case DISPLAY:
                        return "video-display";
                    case SCANNER:
                        return "scanner";
                    case PRINTER:
                        return "document-print";
                    case CAMERA:
                        return "camera-web";
                    default:
                        assert_not_reached();
                }

            }
        }

        // Todo: Add:
        //          - owner uint : this only the UID of the user ;(
        //          - embedded bool
        //          - seat string
        //          - colourspace string
        //          - metadata HashTable<string string>
        //
        //          - _getProfiles() : returns arraylist of Profile-ObjectPath-ArrayList,internal only
        //          - getProfiles() : return ArrayList of Profile instances that this device uses
        //          -
        //
        // don't add:
        //          - Mode (virtual, physicalm unknown) : even colormgr doesn't show this
        //          - scope (normal, temp, disk) : what is this?
        /* Fields */
        private ObjectPath path;
        private org.freedesktop.Device d;

        private bool enabled; // these are all attributes allc
        private Kind kind;
        private string vendor;
        private string model;
        private string serial;
        private string device_id;

        private uint owner;
        private bool embedded;
        private string seat;
        private string colorspace;
        private HashTable<string, string> metadata; // public void HashMap


        /* Constructor */
        public Device(ObjectPath path) throws IOError {
            this.path = path;

            this.d = Bus.get_proxy_sync(
            BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                this.path // objpath
            );

            //this.kind = this.d.kind;
            switch (this.d.kind) {
                case "display":
                    this.kind = Kind.DISPLAY; break;
                case "scanner":
                    this.kind = Kind.SCANNER; break;
                case "printer":
                    this.kind = Kind.PRINTER; break;
                case "camera":
                    this.kind = Kind.CAMERA; break;
                default:
                    this.kind = Kind.UNKNOWN; break;
            }


            this.vendor = this.d.vendor;
            this.model = this.d.model;
            this.serial = this.d.serial;
            this.device_id = this.d.device_id;
            this.enabled = this.d.enabled;
        }


        /* Methods */
        public string to_string() {
            return " %s %s - %s".printf(vendor, model, serial);

        }
        public ObjectPath get_objectpath() {
            return this.path;
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



}
