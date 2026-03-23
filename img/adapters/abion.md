---
title: Abion
---

**Metadata**

SEO Title: Asset Management for Abion | Axonius

Description: Integrate Abion with the Axonius Asset Management Platform. Abion is a cybersecurity platform that offers solutions for managing and securing digital assets.

---

Abion is a cybersecurity platform that offers solutions for managing and securing digital assets, including DNS zones, domains, and organizational management.

### Use Cases the Adapter Solves

- **DNS Infrastructure Visibility:** Discover and track all DNS zones and domains managed through Abion to ensure complete visibility of your DNS infrastructure and identify shadow DNS assets.
- **Domain Lifecycle Management:** Monitor domain expiry dates, renewal status, and transfer dates to prevent service disruptions and ensure timely renewals.
- **Organizational Asset Mapping:** Map DNS assets to organizational units to understand asset ownership and improve governance across distributed teams.

### Asset Types Fetched

* Domains & URLs
* Organizational Units

<br />

## Data Retrieved through the Adapter

**Domains & URLs**
- DNS zones and domains, organisation information, DNS type
- Record type, pending status, deleted status, slave configuration
- Expiry date, transfer date, auto-renew settings
- DNS records, registry lock status, private WHOIS settings

**Organizational Units**
- Organisation name, description
- Parent organisation ID

<br />

## Before You Begin

### Required Ports

<br />

* TCP port 443 (HTTPS)

### Authentication Methods

API Key Authentication

The Abion adapter uses API Key authentication via the `X-API-KEY` HTTP header.

### APIs

Axonius uses the Abion Core API v1. The following endpoints are called:

- `GET /v1/zones` - Fetches DNS zones
- `GET /v1/zones/{id}` - Fetches DNS records for a specific zone
- `GET /v1/domains` - Fetches domain information
- `GET /v1/organisations` - Fetches organizational units

### Required Permissions

To create and manage API key users, your account must have both **User Admin** and **API Admin** roles.

The API user must be set with the following roles:

- **API User**
- **Order View**
- **Certificate Admin View**
- **DNS Admin View**
- **Domain Admin View**

> **Note:** The exact permission names should be confirmed with your Abion administrator or Abion support, as detailed API documentation may require customer access.

### Supported From Version

Supported from Axonius version 8.0.21

### Setting Up Abion to Work with Axonius

<br />

To generate an API key in Abion:

1. Log in to your Abion account with an account that has **User Admin** and **API Admin** roles.
2. Navigate to the API settings or user management section.
3. Create a new API user with the required permissions listed above.
4. Generate an API key for the user.
5. Copy the API key securely - you will need this to configure the adapter in Axonius.

<br />

## Connecting the Adapter in Axonius

Navigate to the Adapters page, search for Abion, and click on the adapter tile.

Click **Add Connection**.

To connect the adapter in Axonius, provide the following parameters:

### Required Parameters

1. **Host Name or IP Address** - Base URL of the Abion API. Example: `https://api.abion.com`
2. **API Key** - The API key generated from your Abion account. This is sent as the `X-API-KEY` request header.
3. **Verify SSL** - Select whether to verify the SSL certificate of the server against the CA database inside of Axonius. For more details, see [SSL Trust & CA Settings](/docs/certificate-settings#ssl-trust-ca-settings).

<br />

### Optional Parameters

1. **HTTPS Proxy** - Connect the adapter to a proxy instead of directly connecting it to the domain.
2. **HTTPS Proxy User Name** - The user name to use when connecting to the value supplied in **Host Name or IP Address** via the value supplied in **HTTPS Proxy**.
3. **HTTPS Proxy Password** - The password to use when connecting to the server using the **HTTPS Proxy**.

<br />

To learn more about common adapter connection parameters and buttons, see [Adding a New Adapter Connection](/docs/adding-a-new-adapter-connection).

<br />

## Advanced Settings

<Callout icon="📘" theme="info">
  Note:
  Advanced settings can either apply to all connections for this adapter, or to a specific connection. Refer to [Advanced Configuration for Adapters](/docs/advanced-configuration-for-adapters).
  To learn more about **Adapter Configuration** tab advanced settings, see [Adapter Advanced Settings](/docs/advanced-settings).
</Callout>

<br />

The Abion adapter does not have additional advanced configuration settings beyond the standard connection parameters.

<br />

### Related Enforcement Actions

The Abion adapter does not currently support enforcement actions. It is a read-only integration for asset discovery and data collection.

<br />
<br />
<br />

---

**Reference:** Jira ticket ASTS-56939

