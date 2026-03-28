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

### Notes

- Changes to configuration require restarting the add-on.
- In most cases, the default settings are sufficient.

## Data Storage

All data is stored under the configured `data_dir`:

- Database: `${data_dir}/logbook.db`
- Uploads: `${data_dir}/uploads`

By default, this maps to the add-on’s persistent `/data` volume, so data survives restarts and upgrades.

## Ingress

This add-on runs entirely through Home Assistant Ingress:

- No ports need to be exposed
- Access is handled through the Home Assistant UI
- The logged-in Home Assistant user is used as the default actor

## Scope & Expectations

Like the core application, this add-on is intentionally lightweight and informal.

It is not intended to be a system of record, accounting system, or long-term archive. It is best suited as a practical, day-to-day logbook for reference and convenience.

## Support

- Add-on repository: <https://github.com/orionshock/home-services-logbook-addon>
- Application source: <https://github.com/orionshock/HomeServicesLogbook>