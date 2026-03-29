# Home Services Logbook

A Home Assistant add-on that runs [Home Services Logbook](https://github.com/orionshock/HomeServicesLogbook) — a simple self-hosted web app for keeping a household service history in one place.

Think of it as the digital version of the spiral-bound notebook next to the phone, or a small filing cabinet for service records, notes, and documents.

## Features

- Vendor management with a chronological service timeline
- Attachments for storing invoices, photos, and documents
- Labels for simple categorisation and filtering
- Calendar export (`.ics`) for service history

## Installation

1. Navigate to **Settings → Add-ons → Add-on Store** in Home Assistant.
2. Open the **⋮** menu (top-right) and select **Repositories**.
3. Add: https://github.com/orionshock/home-services-logbook-addon
4. Install **Home Services Logbook**.
5. Start the add-on.
6. Open it via the **Web UI** (or sidebar if pinned).

## Configuration

| Option | Default | Description |
|---|---|---|
| `allow_session_user_override` | `false` | Allows switching the active user via a browser cookie. Useful in shared households where multiple people use the same Home Assistant account. |
| `data_dir` | `/data` | Base directory for all application data. If unset, `/data` is used automatically. |

## Support
<https://github.com/orionshock/HomeServicesLogbook>