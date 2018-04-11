name 'windows-chef-runs-cleanup'
maintainer 'Nick Alteen'
maintainer_email 'alteenn@amazon.com'
license 'All Rights Reserved'
description 'Installs/Configures windows-chef-runs-cleanup'
long_description 'Installs/Configures windows-chef-runs-cleanup'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/windows-chef-runs-cleanup/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/windows-chef-runs-cleanup'

# Performs cleanup of C:/chef/runs on Windows OpsWorks Stacks instances.
