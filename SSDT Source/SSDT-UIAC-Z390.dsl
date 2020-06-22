// SSDT-UIAC-ALL.dsl
//
// This SSDT can be used as a template to build your own
// customization for USBInjectAll.kext.
//
// This SSDT contains all ports, so using it is the same as without
// a custom SSDT.  Delete ports that are not connected or ports you
// do not need.
//
// Change the UsbConnector or portType as needed to match your
// actual USB configuration.
//

DefinitionBlock ("", "SSDT", 2, "hack", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "8086_a36d", Package()
            {
                "port-count", Buffer() { 26, 0, 0, 0 },
                "ports", Package()
                {
                    "HS03", Package() // Rear Top Red USB 3.1 port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    "HS04", Package() // Rear Bottom Red USB 3.1 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 4, 0, 0, 0 },
                    },
                    "HS05", Package() // Internal USB Hub => Front Panel USB 2/3.1 Port x4
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                    "HS06", Package() // Internal USB Hub => Front Panel USB 2/3.1 Port x4
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 6, 0, 0, 0 },
                    },
                    "HS07", Package() // Rear 4 port USB 3.0 Hub Orange & Blue
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS09", Package() // Rear Black Right Hand USB 2.0
                    {
                        "UsbConnector", Zero,
                        "port", Buffer() { 9, 0, 0, 0 },
                    },
                    "HS10", Package() // Rear Black Left Hand USB 2.0
                    {
                        "UsbConnector", Zero,
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    "HS11", Package() // Internal motherboard header => Fenvi T919 Bluetooth
                    {
                        "UsbConnector", 0xFF,
                        "port", Buffer() { 11, 0, 0, 0 },
                    },
                    "HS12", Package() // Internal motherboard header => Fenvi T919 Bluetooth
                    {
                        "UsbConnector", 0xFF,
                        "port", Buffer() { 12, 0, 0, 0 },
                    },
                    "SS01", Package() // Front Panel USB 3.1 Gen 2 Type C (HS01 disabled)
                    {
                        "UsbConnector", 9,
                        "port", Buffer() { 17, 0, 0, 0 },
                    },
                    "SS03", Package() // Rear Top Red USB 3.1 port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 19, 0, 0, 0 },
                    },
                    "SS04", Package() // Rear Bottom Red USB 3.1 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 20, 0, 0, 0 },
                    },
                    "SS05", Package() // Internal USB Hub => Front Panel USB 2/3.1 Port x4
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 21, 0, 0, 0 },
                    },
                    "SS06", Package() // Internal USB Hub => Front Panel USB 2/3.1 Port x4
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 22, 0, 0, 0 },
                    },
                    "SS07", Package() // Rear 4 port USB 3.0 Hub Orange & Blue
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 23, 0, 0, 0 },
                    },
                },
            },
        })
    }
}
