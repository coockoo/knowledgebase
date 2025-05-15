const std = @import("std");
const net = std.net;
const Connection = std.net.Server.Connection;
const spawn = std.Thread.spawn;

pub fn main() !void {
    const address = try net.Address.parseIp4("127.0.0.1", 42069);

    var server = try address.listen(.{ .reuse_address = true });
    defer server.deinit();

    while (true) {
        const connection = try server.accept();
        _ = try spawn(.{}, accept, .{ connection });
    }
}

fn accept(connection: Connection) !void {
    defer connection.stream.close();

    var buf: [2048]u8 = undefined;
    @memset(&buf, 0);
    var reader = connection.stream.reader();
    const bad_request =
        \\HTTP/1.1 400 Bad Request
        \\Connection: close
        \\
        \\
        ;
    const top_line = reader.readUntilDelimiterOrEof(&buf, '\n') catch {
        try connection.stream.writeAll(bad_request);
        return;
    };
    if (top_line == null) {
        try connection.stream.writeAll(bad_request);
        return;
    }

    var it = std.mem.splitScalar(u8, top_line.?, ' ');
    const method = it.next();
    const url = it.next();

    if (method == null or url == null) {
        try connection.stream.writeAll(bad_request);
        return;
    }

    var content_buf: [256]u8 = undefined;
    @memset(&content_buf, 0);
    const content_fmt =
        \\{{"method":"{s}","url":"{s}","your":"mom"}}
        ;
    const content_slice = try std.fmt.bufPrint(&content_buf, content_fmt, .{method.?, url.? });

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
    const response_slice = try std.fmt.bufPrint(&response_buf, fmt, .{ content_slice.len, content_slice });
    try connection.stream.writeAll(response_slice);
}
