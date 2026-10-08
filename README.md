# DevOps Interview Task (Part 1): Containerize

**This is a take-home task.** Please submit by the date given when the task was
issued.

## Overview

You are given a small web application (`app/`). A working `Dockerfile` is
provided, but it was written quickly and does **not** follow container best
practices. Your job is to refactor it into a production-quality image and push
it to a container registry.

You do **not** need to modify the application code.

## What we provide

Clone this repository into your local account.

> **Do Not** fork this repository. Clone it and re-push it into your local account.

The following is provided as part of this repository:

```text
Dockerfile            # a working but non-production Dockerfile — improve it
app/
  app.py              # a minimal Python Flask web app (do not modify)
  requirements.txt    # the app's dependencies (do not modify)
```

The application:

-   Listens on the port given by the `PORT` environment variable (default `8080`).
-   Reads a `GREETING` environment variable used in its response.
-   Exposes `GET /`, `GET /healthz`, and `GET /info`.

## Improvements Made

- Switched from `python:3.12` to `python:3.12-slim`
- Pinned the base image using a SHA digest for reproducible builds
- Removed unnecessary runtime packages (`build-essential`, `gcc`, `curl`, `vim`)
- Improved Docker layer caching by copying `requirements.txt` before application code
- Added a non-root user (`appuser`)
- Added `.dockerignore`
- Reduced image size from approximately 439 MB to 49 MB
