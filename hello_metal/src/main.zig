const std = @import("std");

// Basic Metal type declarations
pub const MTLDevice = opaque {};
pub const NSString = opaque {};

// External function declarations
pub extern "c" fn MTLCreateSystemDefaultDevice() ?*MTLDevice;
pub extern "c" fn objc_msgSend(self: *anyopaque, sel: *anyopaque, ...) *anyopaque;
pub extern "c" fn sel_registerName(name: [*:0]const u8) *anyopaque;

pub fn main() !void {
    // Get the default Metal device
    const device = MTLCreateSystemDefaultDevice();
    if (device == null) {
        std.debug.print("Failed to create Metal device\n", .{});
        return error.NoMetalDevice;
    }

    // Try to get device name using objc_msgSend
    const sel_name = sel_registerName("name");
    const name = @as(*const NSString, @ptrCast(objc_msgSend(device.?, sel_name)));

    std.debug.print("Got Metal device {s}\n", .{name});
}
