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
        //          - _getProfiles() : returns arraylist of Profile-ObjectPath-ArrayList,internal only
        //          - getProfiles() : return ArrayList of Profile instances that this device uses
        // don't add:
        //          - Mode (virtual, physicalm unknown) : even colormgr doesn't show this
        //          - scope (normal, temp, disk) : what is this?


        private ObjectPath[] _getProfiles() {
            return this.d.profiles;
        }

        public ArrayList<Profile> getProfiles() {
            ArrayList<Profile> p_list = new ArrayList<Profile>();

            var op_list = _getProfiles();
            //stdout.printf("profiles of %s\n", this.to_string());
            foreach (var p_op in op_list) {
                try {
                    Profile p = ColorManager.getProfile(p_op);
                    p_list.add(p);
                    //stdout.printf("\t%s\n", (string) p_op);
                } catch (NotFoundError e) {
                    warning("Profile not found: " + (string) p_op);
                    // Profile doesn't exist anymore?, this should not be possible
                }
            }
            /*for (int i=0; i< op_list.length; i++) {
                try {
                    Profile p = ColorManager.getProfile(op_list[i]);
                    p_list.add(p);
                    stdout.printf("\t%s\n", (string) op_list[i]);
                } catch (NotFoundError e) {
                    // Profile doesn't exist anymore?, this should not be possible
                }
            }*/

            return p_list;
        }

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
            switch (d.kind) {
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


            this.vendor = d.vendor;
            this.model = d.model;
            this.serial = d.serial;
            this.device_id = d.device_id;
            this.enabled = d.enabled;

            this.owner = d.owner;
            this.embedded = d.embedded;
            this.seat = d.seat;
            this.colorspace = d.colorspace;
            this.metadata = d.metadata;
        }


        /* Methods */
        public string to_string() {
            return " %s %s - S/N:%s".printf(vendor, model, serial);

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
