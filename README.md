helium-etl-queries
==================

A collection of SQL queries used to enrich data produced by a Helium [blockchain-etl](https://github.com/helium/blockchain-etl)

This repo is specifically trying to create and manage views that better surface the embedded JSON fields in a
more managable form, e.g. turning `transactions[type='state_channel_close']` => `data_credits` table, with properly typed columns

A live instance with these views is avaialble on the beta DeWi ETL instance, which runs Metabase:

https://etl.dewi.org

If you're interested in using it, please contact @jamiedubs/@wishplorer on Discord. There is auto signup available if using gmail.com email address with google signin.

Documentation available on: https://dbdocs.io/wishplorer/HeliumDewiETL

Setup
----

- setup a blockchain-etl instance – this might take a while
- load all the views from this repository:

```
dbname="etl"
for i in views/*; do psql $dbname < $i; done
```

Or load them one at a time etc.

TODO
----
* More views: `challenges`, `consensus_groups`, `payments`, split out reward-types, etc
* Get fancy and use [dbt](https://github.com/fishtown-analytics/dbt)


Contributing
------------

* Pull requests welcome
* Ask questions in #hips or #blockchain-dev on Discord

Contributors
------------

* @\~zav\~
* @jamiedubs ([@jamiew](https://github.com/jamiew/))
* [@wishplorer](https://github.com/wishplorer)
* [@GregKarabinos](GregKarabinos)

License
-------

MIT
