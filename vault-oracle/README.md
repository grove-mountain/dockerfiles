# Vault with Oracle plugin and libraries installed

This is a reference Dockerfile for building a version of Vault with the Oracle Database Plugin as well as the necessary Oracle client libraries installed.   

This is not mean to be used in production without proper vetting, but is here to show the process for how to include the Oracle tools as they are not included by default by HashiCorp.

The only customizations that may need to be done is to change some of the versions for the Oracle plugin or client libraries.  Change those values in the .env file included.
