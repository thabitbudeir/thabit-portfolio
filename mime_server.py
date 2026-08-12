import http.server
import socketserver
import mimetypes
import os

# Force correct MIME types regardless of Windows registry mapping
mimetypes.add_type('application/javascript', '.js')
mimetypes.add_type('application/javascript', '.mjs')
mimetypes.add_type('application/wasm', '.wasm')
mimetypes.add_type('application/json', '.json')
mimetypes.add_type('text/css', '.css')
mimetypes.add_type('image/svg+xml', '.svg')
mimetypes.add_type('application/pdf', '.pdf')

os.chdir('build/web')
handler = http.server.SimpleHTTPRequestHandler
with socketserver.TCPServer(('127.0.0.1', 8081), handler) as httpd:
    print('Serving on http://127.0.0.1:8081')
    httpd.serve_forever()
