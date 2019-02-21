using Gee;

namespace ColorManager {


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


        private ObjectPath path;
        private org.freedesktop.Device d;

        private bool enabled; // these are all attributes allc
        private Kind kind;
        private string vendor;
        private string model;
        private string serial;
        private string device_id;

        public string to_string() {
            return " %s: %s %s - %s - %s".printf(kind.to_string(), vendor, model, serial, device_id);

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
