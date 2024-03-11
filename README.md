# GCP role finder

Python script to build a local database of GCP roles and their included
permissions for easy searching.


_*Please Note:*_ This script is not owned, supported or endorsed by Google. Use
at your own risk etc.

## Why?

I needed a quick way of finding roles which contained certain permissions
locally

...and I fancied an SQLite, Python and Google API adventure


## Requirements

You'll need python3 with the Google API client installed

Your Google client will need to be setup with application default credentials
to be able to talk to the Google API's needed to build the database.

Please see
https://cloud.google.com/docs/authentication/application-default-credentials
for more information on setting up application default credentials


## Usage

### Updating the database

Run the following command to update/create the database of roles:

```
gcp-role-find -u
```


### Finding a role

Run the script with the following option

```
gcp-role-find -f <permission>
```

Multiple searches can be performed at once by adding additional `-f` options as
required.

The launch stage of a role can also be searched for with the `-s` option to
narrow the search.

example:

```
gcp-role-find -f resourcemanager.projects.list -s GA
```


### Database location

By default the script uses `roles.db` in your current working directory.
This can be changed with the `--db` command line option or `ROLES_DB` ENV
variable and supplying a full path as required.


### Container Image

There's a container image available to be built based on alpine if you dont
want to install python on your system.

The image defaults to the database located at `/data/roles.db`


## Issues and things to be aware of

### Missing data

Some data is not provided by the API. When the data has not been provided the
database field will contain a `Null`

#### Stage info
Sometimes the API appears to fail to return the release stage info data for a
role.

Re-running an update may solve the missing data issue

#### Descriptions and permissions

Some roles appear to lack permissions info and some lack descriptions entirely.


### Data overwrite on update

An update will clobber the existing data for a role in the database when an
update is performed. An `INSERT OR REPLACE` is used for the insertion of data.
This helps with the missing data issue above rather than collecting `Null`'s

### No database provided

Your view of available roles may differ from mine due to various reasons such
as NDA's, regonal availability or other reasons.

