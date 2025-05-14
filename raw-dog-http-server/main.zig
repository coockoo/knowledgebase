const std = @import("std");
const net = std.net;

pub fn main() !void {
    const address = try net.Address.parseIp4("127.0.0.1", 42069);

    var server = try address.listen(.{});
    defer server.deinit();

    const connection = try server.accept();

    var buf: [2048]u8 = undefined;
    @memset(&buf, 0);
    // TODO: try reader and do not deinit server, just work in listen mode
    // connection.stream.reader
    // _ = try connection.stream.readAll(&buf);

    const content = "{\"your\":\"mom\"}";
    var response_buf: [1024]u8 = undefined;
    @memset(&response_buf, 0);

    const fmt =
        \\HTTP/1.1 200 OK
        \\Content-Type: application/json
        \\Content-Length: {d}
        \\Connection: close
        \\
        \\{s}
        ;

    const response_slice = try std.fmt.bufPrint(&response_buf, fmt, .{ content.len, content });
    try connection.stream.writeAll(response_slice);
    connection.stream.close();

    std.debug.print("got message {s}", .{buf});
}
