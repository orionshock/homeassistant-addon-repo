# Home Services Logbook

A Home Assistant Add-on that runs [Home Services Logbook](https://github.com/orionshock/HomeServicesLogbook) — a simple self-hosted web app for keeping a household service history in one place.

Think of it as the digital version of the spiral-bound notebook next to the phone, or the filing cabinet for all the paperwork.

## Features

- **Vendor Management & Timeline** — track who did what and when
- **Attachments** — add, remove, and download files per service entry
- **Labels** — categorise and filter entries
- **Calendar Export** — generate downloadable `.ics` files for any service

## Installation

1. Navigate to **Settings → Add-ons → Add-on Store** in your Home Assistant instance.
2. Click the **⋮** menu (top-right) and choose **Repositories**.
3. Add the following URL:
   ```
   https://github.com/orionshock/home-services-logbook-addon
   ```
4. Find **Home Services Logbook** in the store and click **Install**.
5. Start the add-on and open the **Web UI** tab.

## Configuration

| Option | Type | Default | Description |
|---|---|---|---|
| `allow_session_user_override` | `bool` | `false` | Allow the active user identity to be overridden via a browser cookie (useful for shared households). |
| `data_dir` | `str?` | `"/data"` | Base directory used for persistent app storage. If empty or unset, `/data` is used. |

## Data Storage

Storage is derived from `data_dir`:

- Database: `${data_dir}/logbook.db`
- Uploads: `${data_dir}/uploads`

By default this resolves to the add-on's persistent `/data` volume, so data survives restarts and upgrades.

## Ingress

The add-on is intended to run through Home Assistant Ingress.

## Support

- Add-on repository: <https://github.com/orionshock/home-services-logbook-addon>
- Application source: <https://github.com/orionshock/HomeServicesLogbook>
