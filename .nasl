# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:litespeedtech:litespeed_cache";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.128050");
  script_version("2024-10-24T07:44:29+0000");
  script_tag(name:"last_modification", value:"2024-10-24 07:44:29 +0000 (Thu, 24 Oct 2024)");
  script_tag(name:"creation_date", value:"2024-09-06 10:00:00 +0000 (Fri, 06 Sep 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-10-23 14:16:02 +0000 (Wed, 23 Oct 2024)");

  script_cve_id("CVE-2024-44000");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress LiteSpeed Cache < 6.5.0.1 Account Takeover Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("gb_wordpress_plugin_http_detect.nasl");
  script_mandatory_keys("wordpress/plugin/litespeed-cache/detected");

  script_tag(name:"summary", value:"The WordPress plugin 'LiteSpeed Cache' is prone to an account
  takeover vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The plugin allows to an unauthenticated account takeover using
  an HTTP response headers leak on the debug log file which also leaks the 'Set-Cookie' header
  after the users perform a login request.");

  script_tag(name:"impact", value:"Unauthenticated visitor can gain access to logged-in user
  accounts. In the worst-case scenario, this could lead to Administrator-level access which allows
  malicious plugins to be uploaded and installed. It can also result in the sensitive information
  exposure due to the exposed debug.log file.");

  script_tag(name:"affected", value:"WordPress LiteSpeed Cache prior to version 6.5.0.1.");

  script_tag(name:"solution", value:"Update to version 6.5.0.1 or later.");

  script_xref(name:"URL", value:"https://www.wordfence.com/threat-intel/vulnerabilities/wordpress-plugins/litespeed-cache/litespeed-cache-641-unauthenticated-sensitive-information-exposure-via-log-files");
  script_xref(name:"URL", value:"https://patchstack.com/articles/critical-account-takeover-vulnerability-patched-in-litespeed-cache-plugin/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe: CPE ) )
  exit( 0 );

if( ! infos = get_app_version_and_location( cpe: CPE, port: port, exit_no_version: TRUE ) )
  exit( 0 );

version = infos["version"];
location = infos["location"];

if( version_is_less( version: version, test_version: "6.5.0.1" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "6.5.0.1", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );