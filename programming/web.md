# Web

## Etag

Used to save bandwidth and not to send huge payloads.
If content didn't change by given etag value – send 304, if changed – send content + 200.
Google Cloud supports it out of the box.
