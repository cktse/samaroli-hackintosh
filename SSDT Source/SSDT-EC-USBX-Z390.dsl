/*
 * AppleUsbPower compatibility table for Skylake+.
 *
 * Be warned that power supply values can be different
 * for different systems. Depending on the configuration
 * these values must match injected IOKitPersonalities
 * for com.apple.driver.AppleUSBMergeNub. iPad remains
 * being the most reliable device for testing USB port
 * charging support.
 *
 * Try NOT to rename EC0, H_EC, etc. to EC.
 * These devices are incompatible with macOS and may break
 * at any time. AppleACPIEC kext must NOT load.
 * See the disable code below.
 *
 * Reference USB: https://applelife.ru/posts/550233
 * Reference EC: https://applelife.ru/posts/807985
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "SsdtEC", 0x00001000)
{
    /*
     * Uncomment replacing EC0 with your own value in case your
     * motherboard has an existing embedded controller of PNP0C09 type.
     *
     * While renaming EC0 to EC might potentially work initially,
     * it connects an incompatible driver (AppleACPIEC) to your hardware.
     * This can make your system unbootable at any time or hide bugs that
     * could trigger randomly.
     */

    // Leave _SB_.PCI0.LPCB.H_EC untouched as PNP0C09 already has an _STA method

    Scope (\_SB)
    {
        // Create a USBX device for USB power properties
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply",
                    0x13EC,
                    "kUSBSleepPortCurrentLimit",
                    0x0834,
                    "kUSBWakePowerSupply",
                    0x13EC,
                    "kUSBWakePortCurrentLimit",
                    0x0834
                })
            }
        }

        // Create a "dummy" EC for macOS
        // The EC is supposed to be located after the LPC device but doesn't actually matter since this is just a dummy device
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}