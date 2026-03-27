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
| `trust_upstream_auth` | `bool` | `false` | Trust an upstream reverse-proxy header for user identity. Enable only when the app is behind a trusted proxy that sets the actor header. |
| `allow_actor_override` | `bool` | `true` | Allow the active user identity to be overridden via a browser cookie (useful for shared households). |

## Data Storage

All data — the SQLite database and uploaded files — is stored in the add-on's persistent `/data` volume and survives restarts and upgrades.

## Ingress

The add-on supports Home Assistant Ingress, so you can open it directly from the **Web UI** tab without exposing any additional ports. Port `8000` is also mapped if direct access is preferred.

## Support

- Add-on repository: <https://github.com/orionshock/home-services-logbook-addon>
- Application source: <https://github.com/orionshock/HomeServicesLogbook>
