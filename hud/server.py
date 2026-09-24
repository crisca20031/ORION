#!/usr/bin/env python3
"""Sirve el HUD y mantiene hud/ultimas.json con las últimas 5 notas del vault.

Uso:
    python hud/server.py
    -> abrí http://localhost:8420/hud/
"""
import http.server
import json
import os
import socketserver
import threading
import time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
VAULT = os.path.join(ROOT, "vault")
UI_INDEX = os.path.join(ROOT, "hud", "ultimas.json")
PORT = 8420


def ultimas_notas(n=5):
    archivos = []
    for base, _, files in os.walk(VAULT):
        for f in files:
            if f.endswith(".md") and f != ".gitkeep":
                path = os.path.join(base, f)
                archivos.append((os.path.getmtime(path), os.path.relpath(path, VAULT)))
    archivos.sort(reverse=True)
    return [nombre for _, nombre in archivos[:n]]


def actualizar_indice():
    while True:
        with open(UI_INDEX, "w", encoding="utf-8") as fh:
            json.dump(ultimas_notas(), fh)
        time.sleep(30)


if __name__ == "__main__":
    os.chdir(ROOT)
    threading.Thread(target=actualizar_indice, daemon=True).start()
    with socketserver.TCPServer(("", PORT), http.server.SimpleHTTPRequestHandler) as httpd:
        print(f"HUD en http://localhost:{PORT}/hud/  (Ctrl+C para parar)")
        httpd.serve_forever()
